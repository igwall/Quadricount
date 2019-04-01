//
//  State.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class StateSet {
    
    private var content : [Traveller : Float] = [:]
    private var delegate : StateSetObserver? = nil
    
    var count : Int {
        get {
            return content.count
        }
    }
    
    init(expenses : ExpenseSet){
        for expense in expenses {
            if let buyers = expense.buyers {
                for buyer in buyers {
                    if let traveller = buyer.traveller {
                        self.increment(by: buyer.amount, forTraveller: traveller)
                    }
                }
            }
            
            if let attendees = expense.attendees {
                for attendee in attendees {
                    print(attendee)
                    if let traveller = attendee.traveller {
                        self.decrement(by: attendee.amount, forTraveller: traveller)
                    }
                }
            }
        }
    }
    
    func increment(by: Float, forTraveller: Traveller){
        let value = content[forTraveller] ?? 0
        content[forTraveller] = value + by
        notifyDelegate()
    }
    
    func decrement(by: Float, forTraveller: Traveller){
        let value = content[forTraveller] ?? 0
        content[forTraveller] = value - by
        notifyDelegate()
    }
    
    func getContentAsArray() -> [(Traveller,Float)]{
        return Array(content)
    }
    
    func subscribe(observer : StateSetObserver){
        self.delegate = observer
    }
    
    func notifyDelegate(){
        if let deleg = delegate {
            deleg.travellerSetUpdated()
        }
    }
}

protocol StateSetObserver{
    func travellerSetUpdated()
}

class StateSetViewModel : StateSetObserver{
    
    var content : [(Traveller,Float)]
    var data : StateSet
    
    var count : Int {
        return self.data.count
    }
    
    init(expenses : ExpenseSet){
        self.data = StateSet(expenses: expenses)
        self.content = data.getContentAsArray()
    }
    
    func get(at: Int) -> (Traveller, Float)? {
        guard at >= 0 && at < content.count else { return nil }
        return self.content[at]
    }
    
    func travellerSetUpdated() {
        self.content = data.getContentAsArray()
    }
    
    
    
}

