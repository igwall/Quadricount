//
//  TravellerDAO.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 31/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import CoreData

class TravellerDAO {
    
    static let request : NSFetchRequest<Traveller> = Traveller.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func fetchAll() -> [Traveller]? {
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func fetch(forTravel : Travel) -> [Traveller]?{
        self.request.predicate = NSPredicate(format: "ptravel.pname == %@", forTravel.name)
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
}

