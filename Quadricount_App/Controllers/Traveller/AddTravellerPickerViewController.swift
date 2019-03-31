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
    
    init(pickerView: UIPickerView, travel: Travel){
        self.picker = pickerView
        super.init()
        self.picker.dataSource = self
        self.picker.delegate = self
        self.travel = travel
        self.personSet = PersonSet()
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
        print(personSet.count)
        return personSet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPerson = personSet.getPerson(index: row)
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
