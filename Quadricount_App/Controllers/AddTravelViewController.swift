//
//  AddTravelViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddTravelViewController : UIViewController{
    
    var newTravel : Travel?
    
    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        
    }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "addTravel" {
                guard let name = nameLabel.text else { return }
                self.newTravel = Travel(name: name, picture: UIImage())
            }
        }
    
}
