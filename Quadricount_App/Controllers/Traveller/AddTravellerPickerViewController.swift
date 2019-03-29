//
//  AddTravellerPickerViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddTravellerPickerViewController : NSObject, UIPickerViewDataSource, PersonSetModelDelegate {
    
    // var listOfFullname :[String]
    var picker : UIPickerView
    var personSet : PersonSet!
    
    init(pickerView: UIPickerView){
        self.picker = pickerView
        super.init()
        self.personSet = PersonSet(delegate: self)
        
        
    }
    
    func viewDidLoad() {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return personSet.count
    }
    
}
