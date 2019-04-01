//
//  AddTravellerViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddTravellerViewController: UIViewController{
    
    var newTraveller : Traveller?
    var currentTravel : Travel!
    var pickerController : AddTravellerPickerViewController!
    var travellerSet : TravellerSet!
    var listOfPerson : PersonSet! // List of all Person registered in the application
    var personExisting : Person?
    
    
    
    
    // DATA FROM VIEW FOR CONTROLLER
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstDate: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var secondDate: UITextField!
    var firstdatePicker = UIDatePicker()
    var secondDatePicker = UIDatePicker()
   
    
    override func viewDidLoad() {
        guard let persons = PersonDAO.fetchAll() else {return}
        self.listOfPerson = PersonSet(with: persons)
        self.travellerSet = TravellerSet(travel: currentTravel)
        self.pickerController = AddTravellerPickerViewController(pickerView: picker, travel: currentTravel )
        
        prepareDatePicker(datePicker: firstdatePicker, textField : firstDate)
        prepareDatePicker(datePicker: secondDatePicker, textField: secondDate)
        
    }
    
    func prepareDatePicker(datePicker : UIDatePicker, textField : UITextField){
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dateChanged) )
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar
    }
    
    @objc func dateChanged (){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        if firstDate.isFirstResponder {
            firstDate.text = formatter.string(from: firstdatePicker.date)
        }
        else{
            secondDate.text = formatter.string(from: secondDatePicker.date)
        }
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddTraveller" {
            var newPerson : Person
            personExisting = pickerController.selectedPerson
            // Si on a un nom et un prenom
            if let fname = firstName.text, !fname.isEmpty {
                if let lname = lastName.text, !lname.isEmpty {
                    newPerson = Person(fn: fname, ln: lname)
                } else{
                    fatalError("Vous n'avez pas mis de nom")
                }
            } else {
                guard let res = personExisting else{ return }
                newPerson = res
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            
             if firstDate.text != "" {
                guard let fDate = firstDate.text else {return}
                let dateOne = dateFormatter.date(from: fDate)!
                if secondDate.text != "" {
                    guard let sDate = secondDate.text else {return}
                    let dateTwo = dateFormatter.date(from: sDate)!
                    self.newTraveller = Traveller(person: newPerson, beginDate: dateOne, endDate: dateTwo, travel: self.currentTravel)
                } else {
                    self.newTraveller = Traveller(person: newPerson, beginDate: dateOne, travel: self.currentTravel)
                }
                if let travellerCreated = self.newTraveller {
                    self.travellerSet.add(traveller: travellerCreated)
                }
            }
        }
    }
}


