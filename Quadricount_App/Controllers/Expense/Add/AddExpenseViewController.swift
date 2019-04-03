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

    var datePicker = UIDatePicker()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var dateField: UITextField!
   
    @IBOutlet weak var buyersTableView: UITableView!
    @IBOutlet weak var attendeesTableView: UITableView!
    
    override func viewDidLoad() {
        self.buyersTableViewController = ContributionTableViewController(tableView: self.buyersTableView, travel: self.currentTravel)
        self.attendeesTableViewController = ContributionTableViewController(tableView: self.attendeesTableView, travel: self.currentTravel)
         prepareDatePicker(datePicker: datePicker, textField : dateField)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "didAddExpense" {
            return controlDate()
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didAddExpense" {
            let buyers = self.buyersTableViewController.selectedContributions()
            let attendees = self.attendeesTableViewController.selectedContributions()
            if let name = nameField.text, let date = dateField.text, let amount = Float(amountField.text ?? "0"){
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yyyy"
                 guard let dateOne = formatter.date(from: date) else {return}
                self.newExpense = Expense(name: name, amount: amount, travel: currentTravel, buyers: buyers, attendees: attendees, date: dateOne)
                if let expenseCreated = self.newExpense {
                    self.expenseSet.add(expense: expenseCreated)
                }
            }
        }
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
    
    @objc func dateChanged(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
            self.dateField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func controlDate()-> Bool {
        var correct : Bool
        if let fDate = self.dateField.text, !fDate.isEmpty {
            correct = true
        } else {
            correct = false
            let alert = UIAlertController(title: "Date error", message: "You have to add a date for the expense", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        return correct
    }
    
    
}
