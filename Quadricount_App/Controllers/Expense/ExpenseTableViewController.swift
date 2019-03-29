//
//  ExpenseTableViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class ExpenseTableViewController: NSObject, UITableViewDataSource {
    
    var tableView : UITableView!
    var travel : Travel
    var data : ExpenseSet
    
    init(tableView: UITableView, travel: Travel){
        self.tableView = tableView
        self.travel = travel
        self.data = ExpenseSet(travel: travel)
        super.init()
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseCell
        if let exp = data.get(at: indexPath.row) {
            cell.expenseTitle.text = exp.name
            cell.expenseAmount.text = exp.amount.description
        }
        return cell
    }
}
