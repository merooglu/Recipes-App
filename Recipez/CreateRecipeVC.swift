//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Mehmet Eroğlu on 23.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle : UITextField!
    @IBOutlet weak var recipeIngredients : UITextField!
    @IBOutlet weak var recipeSteps : UITextField!
    @IBOutlet weak var recipeImg : UIImageView!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 10.0
        recipeImg.clipsToBounds = true
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        recipeImg.contentMode = .scaleAspectFill
        recipeImg.image = chosenImage
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage (_ sender: AnyObject!){
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(_ sender : AnyObject!) {
        if let title = recipeTitle.text, title != "" {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
            let recipe = Recipe(entity: entity, insertInto: context)
            
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(img: recipeImg.image!)
            
            context.insert(recipe)
            
            do {
                try context.save()
            }catch {
                print("Could not save recipe")
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}
