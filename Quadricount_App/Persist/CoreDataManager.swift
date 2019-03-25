//
//  CoreDataManager.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 22/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class CoreDataManager {
    static let context : NSManagedObjectContext = getContext();

    
    static func getContext() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            exit(EXIT_FAILURE)
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    class func save() -> NSError? {
        do {
            try CoreDataManager.context.save()
            return nil
        } catch let error as NSError{
            return error
        }
    }
}
