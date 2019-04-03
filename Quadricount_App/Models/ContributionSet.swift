//
//  ContributionSet.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class ContributionSet : Sequence {
    
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
        print("j'ai add")
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
    
    public func makeIterator() -> ItContributionSet{
        return ItContributionSet(set: self)
    }
    
    var description : String {
        var res : String = ""
        for e in self.content {
            res.append(e.description)
        }
        return res
    }

}

class ItContributionSet : IteratorProtocol {
        
    private var listToIterate : ContributionSet
    private var index : Int
    
    public var current : Contribution? {
        guard !self.end else { return nil }
        return self.listToIterate.get(at:self.index)
    }
    
    public var end : Bool {
        return (index < 0) || (index >= listToIterate.count)
    }
    
    fileprivate init(set : ContributionSet){
        self.listToIterate = set
        self.index = 0
    }
    
    public func reset(){
        self.index = 0
    }
    
    public func next() -> Contribution? {
        guard !self.end else { return nil }
        self.index += 1
        return self.listToIterate.get(at: index - 1)
    }
    
}
