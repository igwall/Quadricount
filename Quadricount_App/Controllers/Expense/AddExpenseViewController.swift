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
    var expenseSet : ExpenseSet!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var dateField: UITextField!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddExpense" {
            if let name = nameField.text, let date = dateField.text, let amount = Float(amountField.text ?? "0"){
                self.newExpense = Expense(name: name, amount: amount, travel: currentTravel)
                if let expenseCreated = self.newExpense {
                    self.expenseSet.add(expense: expenseCreated)
                }
            }
        }
    }
}
