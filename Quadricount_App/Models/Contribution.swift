//
//  Contribution.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import CoreData

extension Contribution {
    
    public var amount : Float {
        get {
            return self.pamount
        }
        
        set {
            self.pamount = newValue
        }
    }
    
    public var traveller : Traveller? {
        get {
            return self.ptraveller
        }
        
        set {
            self.ptraveller = newValue
        }
    }
    
    convenience init(amount: Float, traveller: Traveller) {
        self.init(context: CoreDataManager.context)
        self.amount = amount
        self.traveller = traveller
    }
    
    
}
