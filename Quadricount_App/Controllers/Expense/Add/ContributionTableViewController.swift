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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "travellerCell") as! ContributionCell
        cell.traveller = self.data.get(travellerAt: indexPath.row)
        cell.nameLabel?.text = cell.traveller.fullname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ContributionCell {
            if cell.accessoryType == UITableViewCell.AccessoryType.checkmark {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                cell.amountField.isHidden = true
                cell.euroLabel.isHidden = true
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                cell.amountField.isHidden = false
                cell.euroLabel.isHidden = false
            }
        }
    }
    
    func selectedContributions() -> ContributionSet {
        let contributions : ContributionSet = ContributionSet()
        for visibleCell in self.tableView.visibleCells {
            if let cell = visibleCell as? ContributionCell, cell.accessoryType == UITableViewCell.AccessoryType.checkmark, let amount = cell.amountField.text, let traveller = cell.traveller  {
                contributions.add(contribution: Contribution(amount: Float(amount) ?? 0 , traveller: traveller))
            }
        }
        return contributions
    }
    
}
