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
    
    // DATA FROM VIEW FOR CONTROLLER
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstDate: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var secondDate: UITextField!
    var listOfPerson : [Person]?
    var personExisting : Person?
    
    var firstdatePicker = UIDatePicker()
    var secondDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        self.listOfPerson = PersonDAO.fetchAll()
        self.pickerController = AddTravellerPickerViewController(pickerView: picker, travel: currentTravel, travellerSet: self.travellerSet )
        
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
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "didAddTraveller" {
            return controlPersonInput() && dateControlled()
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddTraveller" {
            var travellerToAdd : Traveller
            let personToAdd =  createPersonFromInput()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            if let fDate = self.firstDate.text {
                guard let dateOne = formatter.date(from: fDate) else {return}
                if let sDate = self.secondDate.text{
                    if let dateTwo = formatter.date(from: sDate) {
                        travellerToAdd = Traveller(person: personToAdd, beginDate: dateOne, endDate: dateTwo, travel: self.currentTravel)
                        self.travellerSet.add(traveller: travellerToAdd)
                        print("correctly added")
                    } else { // only have one date
                        travellerToAdd = Traveller(person: personToAdd, beginDate: dateOne, travel: self.currentTravel)
                        self.travellerSet.add(traveller: travellerToAdd)
                        print("correctly added")
                    }
                }else{
                    return
                }
            } else {print ("error")}
        }
    }
    
    
    
    
    
    
    
    func dateControlled() -> Bool{
        var correct : Bool
        if let fDate = self.firstDate.text, !fDate.isEmpty {
            correct = true
        } else {
            correct = false
            let alert = UIAlertController(title: "Date error", message: "You have to add one date or more", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        return correct
    }
    
    func controlPersonInput() -> Bool {
        var correct : Bool
        personExisting = pickerController.selectedPerson
        // Si on a un nom et un prenom
        
        if let fname = firstName.text, !fname.isEmpty {
            if let lname = lastName.text, !lname.isEmpty {
                let allPerson = PersonSet()
                if allPerson.contains(firstName: fname, lastName: lname){
                    let alert = UIAlertController(title: "Person existing", message: "This person already exist, please add it with the carousel below. Don't forget to erase value in fields", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    correct = false
                }
                else { correct = true }
            }else{
                let alert = UIAlertController(title: "Lastname missing", message: "Please enter a lastname", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                correct = false
            }
        } else {
            correct = true
        }
        return correct
    }
    
    func createPersonFromInput() -> Person {
        var personToAdd : Person
        personExisting = pickerController.selectedPerson
        // Si on a un nom et un prenom
        
        if let fname = firstName.text, !fname.isEmpty {
            if let lname = lastName.text, !lname.isEmpty {
                    personToAdd = Person(fn: fname, ln: lname)
                }
                else {
                    fatalError()
                }
            } else {
            if let res = personExisting {
                personToAdd = res
            } else{
                fatalError()
            }
            
        }
        return personToAdd
    }
    
    
    
}


