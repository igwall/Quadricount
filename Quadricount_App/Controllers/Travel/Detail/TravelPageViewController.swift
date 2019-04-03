//
//  TravelPageViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 31/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelPageViewController : UIViewController {
    
    var currentTravel : Travel!
    var expensesTableController : TravelLastExpensesViewController!
    var stateTableController : TravelStateResumeViewController!
    
    @IBOutlet weak var balancedLabel: UILabel!
    @IBOutlet weak var travelName: UILabel!
    @IBOutlet weak var travelImage: UIImageView!
    @IBOutlet weak var lastExpensesTable: UITableView!
    @IBOutlet weak var resumeTable: UITableView!
    
    //We have to use this function cause viewDidLoad is launched BEFORE the TabBarController fills the currentTravel variable
    func initialize(){
        travelName.text = currentTravel.name
        travelImage.image = currentTravel.picture
        balancedLabel.text = currentTravel.balanced ? "Balanced" : "Not Balanced"
        self.expensesTableController = TravelLastExpensesViewController(table: self.lastExpensesTable, travel: self.currentTravel)
        self.stateTableController = TravelStateResumeViewController(table: resumeTable, travel: self.currentTravel)
    }
}
