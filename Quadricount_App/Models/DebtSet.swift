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
    
    var balanced : Bool {
        return self.content.isEmpty
    }
    
    init(travel : Travel){
        generateDebts(expenses : travel.expenses)
    }
    
    public func get(debtAt: Int) -> Debt? {
        guard debtAt >= 0 && debtAt < self.count else { return nil }
        return self.content[debtAt]
    }

    
    // MARK : Debts generation algorithm
    
    private func generateDebts(expenses: ExpenseSet){
        
        let data = StateSetViewModel(expenses: expenses)
        
        /*
         Starting two iterators from the biggest and the smallest state.
         We are trying to fill the biggest state with the smallest.
         Three scenari -> BS + SS > 0 -> SS.next() and we create a debt : SStrav -> -SSamount -> BStrav
                       -> BS + SS < 0 -> BS.next() and we create a debt : SStrav -> BSamount -> BStrav
                       -> BS + SS = 0 -> BS.next() and SS.next() and we create a debt : SStrav -> -SSamount -> BStrav or SStrav -> BSamount -> BStrav
        */
        
        var biggest = 0
        var smallest = data.count - 1
        
        while biggest < smallest {
            if let biggestState = data.get(at: biggest), let smallestState = data.get(at: smallest){
                if ( biggestState.1 + smallestState.1 > 0 ){
                    if smallestState.1 != 0{
                        self.content.append(Debt(giver: smallestState.0, amount: -smallestState.1, receiver: biggestState.0))
                    }
                    smallest -= 1
                } else if ( biggestState.1 + smallestState.1 < 0){
                    if biggestState.1 != 0{
                        self.content.append(Debt(giver: smallestState.0, amount: biggestState.1, receiver: biggestState.0))
                    }
                    biggest += 1
                } else {
                    if smallestState.1 != 0{
                        self.content.append(Debt(giver: smallestState.0, amount: -smallestState.1, receiver: biggestState.0))
                    }
                    smallest -= 1
                    biggest += 1
                }
            }
        }
    }
    
    
    
}
