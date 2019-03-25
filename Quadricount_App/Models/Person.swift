//
//  Person.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 12/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation

extension Person {
    public var lastname : String { return self.plastname ?? "" }
    public var firstname : String { return self.pfirstname ?? "" }
    public var birthdate : Date? {
        get { return self.pbirthdate }
        set { return self.pbirthdate = newValue }
    }
    
    public var fullname : String {
        return self.firstname + " " + self.lastname
    }
    
    public var age : Int? {
        guard let birth = self.birthdate else {
            return nil
        }
        return Calendar.current.dateComponents([.year], from: birth, to: Date()).year!
    }
    
    public convenience init(fn : String, ln: String){
        self.init(context: CoreDataManager.context)
        self.plastname = ln
        self.pfirstname = fn
        self.birthdate = nil
    }
    
    public convenience init(fn : String, ln: String, birthdate: Date){
        self.init(fn: fn, ln: ln)
        self.pbirthdate = birthdate
    }
}

/*extension Person : Equatable {
    public static func ==(p1: Person, p2: Person) -> Bool {
        return p1.lastname == p2.lastname && p1.firstname == p2.firstname && p1.birthdate == p2.birthdate
    }
    
    public static func !=(p1: Person, p2: Person) -> Bool {
        return !(p1 == p2)
    }
}*/
