//
//  BalanceViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class BalanceViewController : UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var generalStateTableView: UITableView!
    @IBOutlet weak var debtsTableView: UITableView!
    @IBOutlet weak var statesTableView: UITableView!
    
    
    var currentTravel : Travel!
    var debtsTableController : DebtsTableViewController!
    var statesTableController : StatesTableViewController!

    override func viewDidLoad() {
        
        
    }
    
    func initialize(){
        self.debtsTableController = DebtsTableViewController(tableView: self.debtsTableView, travel: currentTravel, delegate: self)
        self.statesTableController = StatesTableViewController(tableView: self.statesTableView, travel: currentTravel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let alert = UIAlertController(title: "Mark as paid ? ", message: "Did you pay this debt ? A money transfer will be created", preferredStyle: UIAlertController.Style.actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                if let cell = tableView.cellForRow(at: indexPath) as? DebtCell, let amountText = cell.amount.text, let amount = Float(amountText), let debt = cell.debt, let giver = debt.giver, let receiver = debt.receiver {
                    
                    let buyers = ContributionSet()
                    buyers.add(contribution: Contribution(amount: amount, traveller: giver))
                    
                    let attendees = ContributionSet()
                    attendees.add(contribution: Contribution(amount: amount, traveller: receiver))

                    let expense = Expense(name: "Refunding", amount: amount, travel: self.currentTravel, buyers: buyers, attendees: attendees, date: Date.init())
                    
                    self.currentTravel.expenses.add(expense: expense)
                    
                    self.debtsTableController.refreshDebts()
                    self.statesTableController.refreshStates()
                    
                    self.statesTableView.reloadData()
                    self.debtsTableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
}
