//
//  PersonSet.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import CoreData

public class PersonSet {
    
    fileprivate var content : [Person]
    private var listOfDeleguate : [PersonSetModelDelegate]?
    
    public var isEmpty : Bool {
        return self.content.isEmpty
    }
    
    public var count : Int {
        return self.content.count
    }
    
    public init(delegate: PersonSetModelDelegate? = nil){
        if let res = PersonDAO.fetchAll() {
            self.content = res
        }else {
            self.content = [Person]()
        }
        guard let res = delegate else {return}
        listOfDeleguate?.append(res)
    }
    
    public init(with : [Person], delegate: PersonSetModelDelegate? = nil){
        self.content = with
        guard let res = delegate else {return}
        listOfDeleguate?.append(res)
    }
    
    public func add(person : Person){
        if !self.contains(person: person) {
            self.content.append(person)
        }
    }
    
    public func remove(person : Person){
        if let index = self.content.firstIndex(of: person){
            self.content.remove(at: index)
        }
    }
    
    // MARK: - Totally Equal
    public func contains(person: Person) -> Bool{
        return self.content.contains(person)
    }
}

public protocol PersonSetModelDelegate {
    
}
