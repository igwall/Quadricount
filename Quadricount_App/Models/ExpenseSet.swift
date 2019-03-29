//
//  ExpenseSet.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class ExpenseSet {
    
    private var delegate : ExpenseSetModelDelegate? = nil
    private var content : [Expense]
    
    init(travel : Travel) {
        if let res = ExpenseDAO.fetch(forTravel: travel){
            self.content = res
        } else {
            self.content = []
        }
    }
    
    var count : Int {
        return self.content.count
    }
    
    public func add(expense : Expense){
        content.append(expense)
        if let deleg = self.delegate {
            deleg.expenseAdded()
        }
        CoreDataManager.save()
    }
    
    public func get(at: Int) -> Expense? {
        guard at > 0 && at < self.count else { return nil }
        return self.content[at]
    }
    
}

protocol ExpenseSetModelDelegate {
    func expenseAdded()
    func expenseDeleted()
    func expenseUpdated()
}
