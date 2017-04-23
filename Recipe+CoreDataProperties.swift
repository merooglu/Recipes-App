//
//  Recipe+CoreDataProperties.swift
//  Recipez
//
//  Created by Mehmet Eroğlu on 23.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var ingredients: String?
    @NSManaged public var steps: String?
    @NSManaged public var title: String?

}
