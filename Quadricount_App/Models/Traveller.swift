//
//  Traveller.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import CoreData

extension Traveller {
    
    // A traveller is composed by a person, a begin and end date.
    
    public var person : Person? {
        get {
            return self.pperson
        }

        set {
            self.pperson = newValue
        }
    }
    
    public var beginDate: Date {
        get {
            return self.pbeginDate ?? Date()
        }
        
        set {
            self.pbeginDate = newValue
        }
    }
    
    public var endDate: Date {
        get {
            return self.pendDate ?? Date()
        }
        set {
            self.pendDate = newValue
        }
    }
    
    public var fullname : String {
        guard let p = person else { return "" }
        return p.fullname
    }
    
    public var travel : Travel? {
        get {
            return self.ptravel
        }
        set {
            self.ptravel = newValue
        }
    }
    
    convenience init(person: Person, beginDate: Date, travel: Travel){
        self.init(context: CoreDataManager.context)
        self.person = person
        self.beginDate = beginDate
        self.travel = travel
    }
    
    convenience init(person: Person, beginDate: Date, endDate: Date, travel : Travel){
        self.init(context: CoreDataManager.context)
        self.person = person
        self.beginDate = beginDate
        self.endDate = endDate
        self.travel = travel
    }
    
    public static func ==(t1: Traveller, t2: Traveller) -> Bool {
        return t1.person == t2.person
    }
    
    public static func !=(t1: Traveller, t2: Traveller) -> Bool {
        return !(t1.person == t2.person)
    }
    
    
}

class ViewModelTravellerTable {
    public var travellerFetched : NSFetchedResultsController<Traveller>
    
    public init(data : NSFetchedResultsController<Traveller>){
        self.travellerFetched = data
    }
    
    public var count : Int {
        return self.travellerFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(travellerAt: Int) -> Traveller? {
        return self.travellerFetched.object(at: IndexPath(row: travellerAt, section: 0))
    }
    
    public func add(traveller: Traveller){
        //TODO On ne vérifie pas qu'un utilisateur existe déjà
        let indexPath = self.travellerFetched.indexPath(forObject: traveller)
    }
    
}
