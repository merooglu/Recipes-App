//
//  Recipe+CoreDataClass.swift
//  Recipez
//
//  Created by Mehmet Eroğlu on 23.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Recipe)
public class Recipe: NSManagedObject {

    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data! as NSData
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image! as Data)!
        return img
    }
    
    
}
