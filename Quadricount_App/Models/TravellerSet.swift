//
//  TravellerSet.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

class TravellerSet {
    
    // A traveller is composed by a person, a begin and end date.
    private var travellers : [Traveller]
    private var delegate : TravellerSetModelDelegate? = nil
    
    init(travel : Travel){
        if let res = TravellerDAO.fetch(forTravel: travel){
            if res.count > 0 {
                self.travellers = res
            } else {
                self.travellers = [Traveller]()
            }
        } else {
            self.travellers = [Traveller]()
        }
    }
    
    public func extractPerson()-> PersonSet? {
        let personSet = PersonSet()
        for traveller in self.travellers {
            guard let person = traveller.person else {return nil}
            personSet.add(person: person)
        }
        return personSet
    }
    
    public var isEmpty : Bool {
        return self.travellers.isEmpty
    }
    
    public var count : Int {
        return self.travellers.count
    }
    
    public func subscribe(observer: TravellerSetModelDelegate){
        self.delegate = observer
    }

    
    public func contains(traveller: Traveller) -> Bool{
        return self.travellers.contains(traveller)
    }
    
    public func get(travellerAt: Int) -> Traveller? {
        guard travellerAt >= 0 && travellerAt < self.count else { return nil }
        return self.travellers[travellerAt]
    }
    
    public func add(traveller : Traveller){
        if !self.contains(traveller: traveller) {
            self.travellers.append(traveller)
            if let deleg = self.delegate {
                if let index = travellers.index(of: traveller){
                    deleg.travellerAdded(atIndexPath: IndexPath(row: index, section: 0))
                }
            }
            CoreDataManager.save()
        }
    }
    
    public func delete(travellerAt: Int){
        if let travellerToDelete = self.get(travellerAt: travellerAt){
            travellers.remove(at: travellerAt)
            CoreDataManager.context.delete(travellerToDelete)
            if let deleg = self.delegate {
                deleg.travellerDeleted(atIndexPath: IndexPath(row: travellerAt,section: 0))
            }
            CoreDataManager.save()
        }
    }
}

protocol TravellerSetModelDelegate {
    func travellerAdded(atIndexPath: IndexPath)
    func travellerDeleted(atIndexPath: IndexPath)
    func travellerUpdated(atIndexPath: IndexPath)
}

