//
//  TravellerSet.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation

public class TravellerSet {
    
    // A traveller is composed by a person, a begin and end date.
    public var travellers : [Traveller]
    
    init(travellers: [Traveller]){
        self.travellers = travellers
    }
    
    public var isEmpty : Bool {
        return self.travellers.isEmpty
    }
    
    public var count : Int {
        return self.travellers.count
    }
    
    public func contains(traveller: Traveller) -> Bool{
        return self.travellers.contains(traveller)
    }
    
    public func add(traveller : Traveller){
        if !self.contains(traveller: traveller) {
            self.travellers.append(traveller)
        }
    }
    
    public func remove(traveller: Traveller){
        if let index = self.travellers.firstIndex(of: traveller){
            self.travellers.remove(at: index)
        }
    }
    
    
    
    
}

