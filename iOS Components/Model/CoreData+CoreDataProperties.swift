//
//  CoreData+CoreDataProperties.swift
//  iOS Components
//
//  Created by Deepak Dewani on 09/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//
//

import Foundation
import CoreData


extension CoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataEntity> {
        return NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity")
    }

    @NSManaged public var item: String?

}
