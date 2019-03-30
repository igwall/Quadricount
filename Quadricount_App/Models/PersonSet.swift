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
    
    var content : [Person]
    var delegate : PersonSetModelDelegate? = nil
    
    public var isEmpty : Bool {
        return self.content.isEmpty
    }
    
    public var count : Int {
        return self.content.count
    }
    
    public init(){
        if let res = PersonDAO.fetchAll() {
            self.content = res
        }else {
            self.content = [Person]()
        }
    }
    
    func addDelegate(delegate: PersonSetModelDelegate){
        self.delegate = delegate
    }
    
    func getPerson(index: Int) -> Person?{
        guard index >= 0 && index < self.count
            else {return nil}
        return content[index]
    }
    
    public init(with : [Person]){
        self.content = with
        guard let res = delegate else {return}
        self.delegate = res
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
    func personAdded(at indexPath: IndexPath)
    func personUpdated(at indexPath: IndexPath)
    func personDeleted(at indexPath: IndexPath)
}
