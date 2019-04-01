//
//  GeneralTextFieldDelegate.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 30/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class GeneralTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
