//
//  PhoneBook+CoreDataClass.swift
//  pokemonContactApp
//
//  Created by 단예진 on 7/16/24.
//
//

import Foundation
import CoreData

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
    
    public static let className = "PhoneBook"
    public enum Key {
        static let name = "name"
        static let phoneNumber = "phoneNumber"
        static let image = "image"
        
    }
}
