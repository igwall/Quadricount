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
    var travellerSet : TravellerSet!
    
    // DATA FROM VIEW FOR CONTROLLER
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstDate: UITextField!
    @IBOutlet weak var secondDate: UITextField!
    
    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddTraveller" {
            guard let fname = firstName.text else {return}
            guard let lname = lastName.text else {return}
            let tempPerson = Person(fn: fname, ln: lname)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm-dd-yyyy"
            
             if firstDate.text != "" {
                guard let fDate = firstDate.text else {return}
                let dateOne = dateFormatter.date(from: fDate)!
                if secondDate.text != "" {
                    guard let sDate = secondDate.text else {return}
                    let dateTwo = dateFormatter.date(from: sDate)!
                    self.newTraveller = Traveller(person: tempPerson, beginDate: dateOne, endDate: dateTwo, travel: self.currentTravel)
                } else {
                    self.newTraveller = Traveller(person: tempPerson, beginDate: dateOne, travel: self.currentTravel)
                }
                if let travellerCreated = self.newTraveller {
                    self.travellerSet.add(traveller: travellerCreated)
                }
            }
        }
    }
}


