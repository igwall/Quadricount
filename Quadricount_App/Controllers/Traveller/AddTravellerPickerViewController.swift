//
//  AddTravellerPickerViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddTravellerPickerViewController : NSObject, UIPickerViewDataSource, PersonSetModelDelegate, UIPickerViewDelegate {

    // var listOfFullname :[String]
    var picker : UIPickerView
    var personSet : PersonSet!
    var selectedPerson : Person?
    var travel : Travel!
    var travellerSet : TravellerSet!
    var listOfPerson : PersonSet! // List of all Person registered in the application
    var listOfPersonNotInThisTravel : PersonSet!
    
    init(pickerView: UIPickerView, travel: Travel){
        self.picker = pickerView
        super.init()
        self.picker.dataSource = self
        self.picker.delegate = self
        let getallPersons = PersonDAO.fetchAll()
        guard let allPersons =  getallPersons else {return}
        self.listOfPerson = PersonSet(with: allPersons)
        self.travellerSet = TravellerSet(travel: travel)
        guard let personOfThisTravel = travellerSet.extractPerson() else {return}
        self.listOfPersonNotInThisTravel = PersonSet(with: allPersons) // Liste de toutes les personnes a qui on va soustraire les personnes de ce voyage
        self.listOfPersonNotInThisTravel.makeDiff(personSetToSubstract: personOfThisTravel)
        
        
        self.personSet.addDelegate(delegate: self)
    }
    
    func viewDidLoad() {
        // On va récupérer les travellers, extraire la personne et l'enlever du personSet:
        // L'objectif étant de garder seulement les personnes qui ne sont pas affectées à ce voyage
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return personSet.getPerson(index: row)?.fullname
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let person = listOfPersonNotInThisTravel else {return 0}
        return person.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPerson = listOfPersonNotInThisTravel.getPerson(index: row)
    }
    
    func personAdded(at indexPath: IndexPath) {
        self.picker.reloadAllComponents()
    }
    
    func personUpdated(at indexPath: IndexPath) {
        self.picker.reloadAllComponents()
    }
    
    func personDeleted(at indexPath: IndexPath) {
        self.picker.reloadAllComponents()
    }
    
    
    
}
