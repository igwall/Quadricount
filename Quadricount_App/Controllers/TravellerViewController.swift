//
//  TravellerViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravellerViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tabViewController : TravellerTableViewController!
    
    override func viewDidLoad() {
        self.tabViewController = TravellerTableViewController(tableView: self.tableView)
    }
    
    @IBAction func unwindToTravellerTable(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? AddTravellerViewController {
            if let traveller = sourceViewController.newTraveller {
                self.tabViewController.add(traveller: traveller)
            }
        }
        // Use data from the view controller which initiated the unwind segue
    }
}
