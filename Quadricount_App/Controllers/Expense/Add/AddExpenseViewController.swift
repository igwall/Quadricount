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
    
    var buyersTableViewController : ContributionTableViewController!
    var attendeesTableViewController : ContributionTableViewController!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var dateField: UITextField!
   
    @IBOutlet weak var buyersTableView: UITableView!
    @IBOutlet weak var attendeesTableView: UITableView!
    
    override func viewDidLoad() {
        self.buyersTableViewController = ContributionTableViewController(tableView: self.buyersTableView, travel: self.currentTravel)
        self.attendeesTableViewController = ContributionTableViewController(tableView: self.attendeesTableView, travel: self.currentTravel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddExpense" {
            let buyers = self.buyersTableViewController.selectedContributions()
            //print(self.attendeesTableViewController.selectedContributions())
            if let name = nameField.text, let date = dateField.text, let amount = Float(amountField.text ?? "0"){
                self.newExpense = Expense(name: name, amount: amount, travel: currentTravel, buyers: buyers)
                print(self.newExpense?.buyers)
                if let expenseCreated = self.newExpense {
                    self.expenseSet.add(expense: expenseCreated)
                }
            }
        }
    }
}
