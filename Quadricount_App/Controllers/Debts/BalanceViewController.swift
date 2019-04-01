//
//  BalanceViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class BalanceViewController : UIViewController {
    
    @IBOutlet weak var generalStateTableView: UITableView!
    @IBOutlet weak var debtsTableView: UITableView!
    
    
    var currentTravel : Travel!
    var debtsTableController : DebtsTableViewController!
    
    override func viewDidLoad() {
        
        
    }
    
    func initialize(){
        self.debtsTableController = DebtsTableViewController(tableView: self.debtsTableView, travel: currentTravel)
    }
    
    
}
