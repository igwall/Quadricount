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
    var travel : Travel! // On force car on sait que l'on va nous passer un travel dans tous les cas
    
    override func viewDidLoad() {
        
    }
    
    public func initializeController(){
        self.tabViewController = TravellerTableViewController(tableView: self.tableView,travel: self.travel)
    }
    
    @IBAction func unwindToTravellerTable(_ unwindSegue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTraveller" {
            if let dest = segue.destination as? AddTravellerViewController {
                dest.currentTravel = self.travel
                dest.travellerSet = self.tabViewController.data
            }
        }
    }
}
