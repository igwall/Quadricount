//
//  ExpenseViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class ExpenseViewController : UIViewController {
    
    var currentTravel : Travel!
    @IBOutlet weak var tableView: UITableView!
    var tableViewController : ExpenseTableViewController!
    
    override func viewDidLoad() {
    }
    
    func initializeController(){
        self.tableViewController = ExpenseTableViewController(tableView: tableView, travel: currentTravel)
    }
    
    @IBAction func unwindToExpenseView(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "addExpense" {
            if let travellers = TravellerDAO.fetch(forTravel: self.currentTravel) {
                if travellers.isEmpty {
                    //DO ALERT
                    let alert = UIAlertController(title: "No travellers", message: "You cannot add any expense if you did not add any travellers before", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    return false

                } else {
                    return true
                }
            } else {
                return false
            }
        } else {
            return true 
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addExpense" {
            if let dest = segue.destination as? AddExpenseViewController {
                dest.currentTravel = self.currentTravel
                dest.expenseSet = self.tableViewController.data
            }
        }
    }
}
