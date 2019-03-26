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
    
    public var person : Person { return self.pperson }
    public var beginDate: Date { return self.pbeginDate }
    public var endDate: Date { return self.pendDate }
    
    init(person: Person, beginDate: Date){
        self.person = person
        self.beginDate = beginDate
    }
    
    convenience init(person: Person, beginDate: Date, endDate: Date){
        self.person = person
        self.beginDate = beginDate
        self.endDate = endDate
    }
    
    
    
}
