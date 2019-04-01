//
//  ExpenseDAO.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import CoreData

class ExpenseDAO {
    
    static let request : NSFetchRequest<Expense> = Expense.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func fetchAll() -> [Expense]? {
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func fetch(forTravel : Travel) -> [Expense]?{
        self.request.predicate = NSPredicate(format: "ptravel.pname == %@", forTravel.name)
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
}
