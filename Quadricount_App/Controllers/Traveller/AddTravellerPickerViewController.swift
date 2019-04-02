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
    var allPerson : PersonSet!
    var selectedPerson : Person?
    var travel : Travel!
    var travellerSet : TravellerSet?
    var personNotInTravel : PersonSet!
    
    init(pickerView: UIPickerView, travel: Travel, travellerSet: TravellerSet){
        self.picker = pickerView
        self.travellerSet = travellerSet
        super.init()
        self.travel = travel
        self.allPerson = PersonSet()
        self.allPerson.addDelegate(delegate: self)
        // On va récupérer les travellers, extraire la personne et l'enlever du personSet:
        // L'objectif étant de garder seulement les personnes qui ne sont pas affectées à ce voyage
        if let groupOfPerson = self.travellerSet {
            if let personInTravel = groupOfPerson.extractPersons(){
                print(personInTravel)
                self.personNotInTravel = allPerson.makeDifference(personSetToSubstract: personInTravel)
            } else {
                print("coucou")
                self.personNotInTravel = self.allPerson
            }
        } else {
             self.personNotInTravel = self.allPerson
        }
        self.picker.dataSource = self
        self.picker.delegate = self
        self.pickerView(self.picker, didSelectRow: 0, inComponent: 0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
             return personNotInTravel.getPerson(index: row)?.fullname
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return personNotInTravel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPerson = personNotInTravel.getPerson(index: row)
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
