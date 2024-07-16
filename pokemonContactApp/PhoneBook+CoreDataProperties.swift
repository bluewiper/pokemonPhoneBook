//
//  PhoneBook+CoreDataProperties.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/16/24.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var name: String?
    @NSManaged public var image: String?

}

extension PhoneBook : Identifiable {

}
