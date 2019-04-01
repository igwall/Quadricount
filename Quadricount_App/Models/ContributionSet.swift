//
//  ContributionSet.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class ContributionSet {
    
    private var content : [Contribution]
    
    init(){
        self.content = [Contribution]()
    }
    
    init(nsset : NSSet?){
        if let givenSet = nsset, let content = givenSet.allObjects as? [Contribution] {
            self.content = content
        } else {
            self.content = [Contribution]()
        }
    }
    
    init(expense : Expense) {
        if let res = ContributionDAO.fetch(forExpense: expense){
            if res.count > 0 {
                self.content = res
            } else {
                self.content = [Contribution]()
            }
        } else {
            self.content = [Contribution]()
        }
    }
    
    var count : Int {
        return self.content.count
    }
    
    public func add(contribution : Contribution){
        content.append(contribution)
        CoreDataManager.save()
    }
    
    public func delete(contributionAt: Int){
        if let contributionToDelete = self.get(at: contributionAt) {
            content.remove(at: contributionAt)
            CoreDataManager.context.delete(contributionToDelete)
            CoreDataManager.save()
        }
    }
    
    public func get(at: Int) -> Contribution? {
        guard at >= 0 && at < self.count else { return nil }
        return self.content[at]
    }
    
    public var toNSSet : NSSet{
        return NSSet(array: content)
    }

}
