//
//  DebtSet.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class DebtSet {
    var content = [Debt]()
    
    var count : Int {
        return self.content.count
    }
    
    init(travel : Travel){
        self.content = generateDebts(expenses : ExpenseSet(travel: travel))
    }
    
    public func get(debtAt: Int) -> Debt? {
        guard debtAt >= 0 && debtAt < self.count else { return nil }
        return self.content[debtAt]
    }
    
    // MARK : Debts generation algorithm
    
    private func generateDebts(expenses: ExpenseSet) -> [Debt] {
        /*let states = StateSet()
        
        for expense in expenses {
            if let buyers = expense.buyers {
                for buyer in buyers {
                    if let traveller = buyer.traveller {
                        states.increment(by: expense.amount, forTraveller: traveller)
                    }
                }
            }
            
            if let attendees = expense.attendees {
                for attendee in attendees {
                    if let traveller = attendee.traveller {
                        states.decrement(by: expense.amount, forTraveller: traveller)
                    }
                }
            }
        }
        
        print(expenses.description)*/
        if let trav = expenses.get(at: 0)?.buyers?.get(at: 1)?.traveller, let trav2 = expenses.get(at: 0)?.buyers?.get(at: 0)?.traveller {
            return [Debt(giver: trav, amount: 10, receiver: trav2)]
        } else {
            print("Ton test est vide wesh")
            return [Debt]()
        }
    }
    
    
    
}
