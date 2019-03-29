//
//  FirstViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var travelTableViewController : TravelTableViewController!
    var selectedTravel : Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.travelTableViewController = TravelTableViewController(tableView: self.tableView, upperController: self)
    }
    
    // MARK - Unwinds
    
    @IBAction func unwindToMainView(segue: UIStoryboardSegue){
        if let controller = segue.source as? AddTravelViewController{
            if let newTravel = controller.newTravel {
                travelTableViewController.add(travel: newTravel)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedTravel" {
            if let dest = segue.destination as? TabBarController {
                if let travel = selectedTravel {
                    dest.travel = travel
                }
            }
        }
    }


}
