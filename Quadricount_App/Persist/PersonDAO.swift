//
//  PersonDAO.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 22/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import CoreData

class PersonDAO{
    static let request : NSFetchRequest<Person> = Person.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func fetchAll() -> [Person]? {
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
}
