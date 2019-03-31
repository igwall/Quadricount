//
//  BuyersTableViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 31/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class ContributionTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var tableView : UITableView
    var data : TravellerSet
    var travel : Travel
    
    init(tableView: UITableView, travel: Travel){
        self.tableView = tableView
        self.travel = travel
        self.data = TravellerSet(travel: travel)
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "travellerCell") as! UITableViewCell
        cell.textLabel?.text = self.data.get(travellerAt: indexPath.row)?.fullname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark ? UITableViewCell.AccessoryType.none : UITableViewCell.AccessoryType.checkmark
    }
    
}
