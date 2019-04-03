//
//  Debt.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class Debt {

    public var amount : Float?
    
    public var giver : Traveller?
    
    public var receiver : Traveller?
    
    init(giver: Traveller, amount: Float, receiver: Traveller) {
        self.giver = giver
        self.amount = amount
        self.receiver = receiver
    }
}


