//
//  Debt.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

extension Debt {

    public var amount : Float? {
        get {
            return self.pamount
        }
        
        set {
            self.pamount = newValue ?? 0
        }
    }
    
    public var giver : Traveller? {
        get {
            return self.pgiver
        }
        
        set {
            self.pgiver = newValue
        }
    }
    
    public var receiver : Traveller? {
        get {
            return self.preceiver
        }
        
        set {
            self.preceiver = newValue
        }
    }
    
    convenience init(giver: Traveller, amount: Float, receiver: Traveller) {
        self.init(context: CoreDataManager.context)
        self.giver = giver
        self.amount = amount
        self.receiver = receiver
    }
}


