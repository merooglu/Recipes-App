//
//  RecipeCell.swift
//  Recipez
//
//  Created by Mehmet Eroğlu on 23.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(recipe: Recipe){
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImage()
    }

}
