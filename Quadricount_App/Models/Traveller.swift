//
//  Traveller.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

extension Traveller {
    
    // A traveller is composed by a person, a begin and end date.
    
    public var person : Person? { return self.pperson }
    public var beginDate: Date { return self.pbeginDate ?? Date() }
    public var endDate: Date { return self.pendDate ?? Date()}
    
    convenience init(person: Person, beginDate: Date){
        self.init(context: CoreDataManager.context)
        self.pperson = person
        self.pbeginDate = beginDate
    }
    
    convenience init(person: Person, beginDate: Date, endDate: Date){
        self.init(context: CoreDataManager.context)
        self.pperson = person
        self.pbeginDate = beginDate
        self.pendDate = endDate
    }
    
    public static func ==(t1: Traveller, t2: Traveller) -> Bool {
        return t1.person == t2.person
    }
    
    public static func !=(t1: Traveller, t2: Traveller) -> Bool {
        return !(t1.person == t2.person)
    }
    
}
