//
//  DebtsTableViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class DebtsTableViewController : NSObject, UITableViewDataSource {
    
    var tableView : UITableView
    var currentTravel : Travel
    var data : DebtSet
    
    init(tableView : UITableView, travel: Travel, delegate: UITableViewDelegate){
        self.currentTravel = travel
        self.tableView = tableView
        self.data = currentTravel.debts
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "debtCell", for: indexPath) as! DebtCell
        if let debt = data.get(debtAt: indexPath.row) {
            cell.debt = debt
            cell.giverFirstname.text = debt.giver?.firstname
            cell.receiverFirstname.text = debt.receiver?.firstname
            cell.amount.text = debt.amount?.description
        }
        return cell
    }
    
    
    
}
