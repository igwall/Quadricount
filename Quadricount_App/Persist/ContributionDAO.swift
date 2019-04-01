//
//  ContributionDAO.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import CoreData

class ContributionDAO {
    
    static let request : NSFetchRequest<Contribution> = Contribution.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func fetchAll() -> [Contribution]? {
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func fetch(forExpense : Expense) -> [Contribution]?{
        self.request.predicate = NSPredicate(format: "pexpense.objectID == %@", forExpense.objectID)
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
}
