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
}
