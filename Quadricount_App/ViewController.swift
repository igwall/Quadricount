//
//  ViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 22/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var travelTableViewController : TravelTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.travelTableViewController = TravelTableViewController(tableView: self.tableView)
    }
    
    // MARK - Unwinds
    
    @IBAction func unwindToMainView(segue: UIStoryboardSegue){
        if let controller = segue.source as? AddTravelViewController{
            if let newTravel = controller.newTravel {
                travelTableViewController.add(travel: newTravel)
            }
        }
    }
    


}

