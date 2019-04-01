//
//  ExpenseSet.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class ExpenseSet : Sequence {
    
    private var delegate : ExpenseSetModelDelegate? = nil
    private var content : [Expense]
    
    init(travel : Travel) {
        if let res = ExpenseDAO.fetch(forTravel: travel){
            if res.count > 0 {
                self.content = res
            } else {
                self.content = [Expense]()
            }
        } else {
            self.content = [Expense]()
        }
    }
    
    var count : Int {
        return self.content.count
    }
    
    public func add(expense : Expense){
        content.append(expense)
        if let deleg = self.delegate {
            if let index = content.index(of: expense) {
                deleg.expenseAdded(atIndexPath: IndexPath(row: index, section: 0))
            }
        }
        CoreDataManager.save()
    }
    
    public func delete(expenseAt: Int){
        if let expenseToDelete = self.get(at: expenseAt) {
            content.remove(at: expenseAt)
            CoreDataManager.context.delete(expenseToDelete)
            if let deleg = self.delegate {
                deleg.expenseDeleted(atIndexPath: IndexPath(row: expenseAt, section: 0))
            }
            CoreDataManager.save()
        }
    }
    
    public func get(at: Int) -> Expense? {
        guard at >= 0 && at < self.count else { return nil }
        return self.content[at]
    }
    
    public func subscribe(observer: ExpenseSetModelDelegate){
        self.delegate = observer
    }
    
    public func makeIterator() -> ItExpenseSet{
        return ItExpenseSet(set: self)
    }
    
    var description : String {
        var r : String = ""
        for e in content {
            r += e.description
        }
        return r
    }
    
}

class ItExpenseSet : IteratorProtocol {
    
    private var listToIterate : ExpenseSet
    private var index : Int
    
    public var current : Expense? {
        guard !self.end else { return nil }
        return self.listToIterate.get(at:self.index)
    }
    
    public var end : Bool {
        return (index < 0) || (index >= listToIterate.count)
    }
    
    fileprivate init(set : ExpenseSet){
        self.listToIterate = set
        self.index = 0
    }
    
    public func reset(){
        self.index = 0
    }
    
    public func next() -> Expense? {
        guard !self.end else { return nil }
        self.index += 1
        return self.listToIterate.get(at: index - 1)
    }
}

protocol ExpenseSetModelDelegate {
    func expenseAdded(atIndexPath: IndexPath)
    func expenseDeleted(atIndexPath: IndexPath)
    func expenseUpdated(atIndexPath: IndexPath)
}
