//
//  UserDefaults+CoreDataProperties.swift
//  iOS Components
//
//  Created by Deepak Dewani on 09/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//
//

import Foundation
import CoreData


extension UserDefaultsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDefaultsEntity> {
        return NSFetchRequest<UserDefaultsEntity>(entityName: "UserDefaultsEntity")
    }

    @NSManaged public var key: String?
    @NSManaged public var value: String?

}
