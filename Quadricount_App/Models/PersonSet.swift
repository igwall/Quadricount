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
    
    public var isEmpty : Bool {
        return self.content.isEmpty
    }
    
    public var count : Int {
        return self.content.count
    }
    
    public init(){
        self.content = [Person]()
    }
    
    public init(with : [Person]){
        self.content = with
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
    
    public func look(person: Person) -> Person? {
        if let index = self.content.firstIndex(of: person){
            return self.content[index]
        } else {
            return nil
        }
    }
    
    // MARK: - Firstname Equals
    
    public func contains(firstname: String) -> Bool {
        return self.content.contains { (element) -> Bool in element.firstname == firstname }
    }
    
    public func look(firstname: String) -> [Person]{
        return self.content.filter { (element) -> Bool in element.firstname == firstname }
    }
    
    // MARK: - Lastname Equals
    
    public func contains(lastname: String) -> Bool {
        return self.content.contains { (element) -> Bool in element.lastname == lastname }
    }
    
    public func look(lastname: String) -> [Person]{
        return self.content.filter { (element) -> Bool in element.lastname == lastname }
    }
    
    // MARK: - Firstname & Lastname Equals
    
    public func contains(firstname: String, lastname: String) -> Bool{
        return self.content.contains { (element) -> Bool in element.firstname == firstname && element.lastname == lastname }
    }
    
    public func look(firstname: String, lastname: String) -> [Person]{
        return self.content.filter { (element) -> Bool in element.firstname == firstname && element.lastname == lastname }
    }
    
    // MARK: - Firstname & Lastname & Date Equals
    
    public func contains(firstname: String, lastname: String, birthdate: Date) -> Bool{
        return self.contains(person: Person(fn: firstname, ln: lastname, birthdate: birthdate))
    }
    
    public func look(firstname: String, lastname: String, birthdate: Date) -> Person? {
        if let index = self.content.firstIndex(of: Person(fn: firstname, ln: lastname, birthdate: birthdate)){
            return self.content[index]
        } else {
            return nil
        }
    }
    
    // MARK: -
    
    public func indexOf(person : Person) -> Int?{
        return self.content.index(of: person)
    }
    
    public func makeIterator() -> ItPersonSet{
        return ItPersonSet(set: self)
    }
    
}


public class ItPersonSet {
    
    private var listToIterate : PersonSet
    private var index : Int
    
    public var current : Person? {
        guard !self.end else { return nil }
        return self.listToIterate.content[self.index]
    }
    
    public var end : Bool {
        return (index < 0) || (index >= listToIterate.count)
    }

    fileprivate init(set : PersonSet){
        self.listToIterate = set
        self.index = 0
    }
    
    public func reset(){
        self.index = 0
    }
    
    public func next() -> Person? {
        guard !self.end else { return nil }
        self.index += 1
        return self.listToIterate.content[index - 1]
    }
    
}

public class ViewModelPersonTable{
    
    public var personFetched : NSFetchedResultsController<Person>
    public var delegate : PersonSetViewModelDelegate? = nil
    
   /* public init(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        self.listOfPerson = PersonSet()
        //self.randomFill()
        self.deterministFill()
    }
    
    public init(list : PersonSet){
        self.listOfPerson = list
    }*/
    
    public init(data : NSFetchedResultsController<Person>){
        self.personFetched = data
    }
    
    /*private func randomFill(){
        let listFirstname = ["Bernard", "Thomas" , "Lucas", "Alice", "Sylvie", "Cathy", "Léa", "Françoise" , "Philippe"]
        let listLastname = ["Falcone", "Dupont" , "Goncalves", "Mayeur", "Mitre", "Robert"]
        
        for i in 1...30{
            if i < 15 {
                self.listOfPerson.add(person: Person(fn: listFirstname.randomElement()!, ln: listLastname.randomElement()!, birthdate: Date.init()))
            } else {
                self.listOfPerson.add(person: Person(fn: listFirstname.randomElement()!, ln: listLastname.randomElement()!))
            }
        }
    }*/
    
    /*private func deterministFill(){
        self.listOfPerson.add(person: Person(fn: "Alice", ln: "Burette"))
        self.listOfPerson.add(person: Person(fn: "Thomas", ln: "Falcone"))
        self.listOfPerson.add(person: Person(fn: "Lucas", ln: "Gonçalves"))
        self.listOfPerson.add(person: Person(fn: "Yannick", ln: "Mayeur"))
    }*/
    
    public var count : Int {
        return self.personFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(personAt: Int) -> Person? {
        return self.personFetched.object(at: IndexPath(row: personAt, section: 0))
    }
    
    public func add(person: Person){
        //TODO On ne vérifie pas qu'un utilisateur existe déjà
        if let indexPath = self.personFetched.indexPath(forObject: person) {
            guard ( self.delegate != nil ) else { return }
            self.delegate?.personAdded()
        }
    }
    
}
