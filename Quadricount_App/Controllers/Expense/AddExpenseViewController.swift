//
//  AddExpenseViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddExpenseViewController : UIViewController {
    
    var newExpense : Expense?
    var currentTravel : Travel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddExpense" {
            self.newExpense = Expense(name: "Resto", amount: 50.0, travel: currentTravel)
            
            //TODO NEED TO SAVE AND ADD TO LIST 
        }
    }
}
