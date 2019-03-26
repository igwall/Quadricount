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
    
    
    
    
    
    // DATA FROM VIEW FOR CONTROLLER
    var newTraveller : Traveller?
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstDate: UITextField!
    @IBOutlet weak var secondDate: UITextField!
    
    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTraveller" {
            guard let fname = firstName.text else {return}
            guard let lname = firstName.text else {return}
            let tempPerson = Person(fn: fname, ln: lname)
            let tempFirstDate = 
            
        }
    }
    
    
}


