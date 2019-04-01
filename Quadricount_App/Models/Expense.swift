//
//  Expense.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

extension Expense {
    
    public var name : String {
        get {
            return self.pname ?? ""
        }
        
        set {
            self.pname = newValue
        }
    }
    
    public var amount : Float {
        get {
            return self.pamount
        }
        set {
            self.pamount = newValue
        }
    }
    
    public var picture : UIImage? {
        get {
            guard let data = self.pimage else { return nil }
            return UIImage(data: data)
        }
        set {
            self.pimage = newValue?.pngData()
        }
    }
    
    public var travel : Travel? {
        get {
            return self.ptravel
        }
        
        set {
            self.ptravel = newValue
        }
    }
    
    var buyers : ContributionSet? {
        get {
            return ContributionSet(nsset: self.pbuyers)
        }
        
        set {
            if let givenBuyers = newValue {
                self.pbuyers = givenBuyers.toNSSet
            }
        }
    }
    
    var attendees : ContributionSet? {
        get {
            return ContributionSet(nsset: self.pattendees)
        }
        
        set {
            if let givenAttendees = newValue {
                self.pattendees = givenAttendees.toNSSet
            }
        }
    }
    
    convenience init(name : String, amount: Float, travel: Travel, buyers: ContributionSet, attendees: ContributionSet,  picture: UIImage? = nil){
        self.init(context: CoreDataManager.context)
        self.name = name
        self.amount = amount
        self.travel = travel
        self.buyers = buyers
        self.attendees = attendees
        guard picture != nil else { return }
        self.picture = picture
    }
    
    
}


