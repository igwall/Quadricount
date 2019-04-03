//
//  ExpenseTableViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class ExpenseTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, ExpenseSetModelDelegate {
    
    var tableView : UITableView!
    var travel : Travel
    var data : ExpenseSet
    
    init(tableView: UITableView, travel: Travel){
        self.tableView = tableView
        self.travel = travel
        self.data = travel.expenses
        
        super.init()
        
        self.data.subscribe(observer: self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseCell
        if let exp = data.get(at: indexPath.row) {
            cell.expenseTitle.text = exp.name
            cell.expenseAmount.text = exp.amount.description
            
            if  let date = exp.date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd-yyyy"
                cell.dateLabel.text = formatter.string(from: date)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.data.delete(expenseAt: indexPath.row)
        }
    }
    
    // MARK : UITableViewDelegate functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK : Expense Set Model View Delegate functions
    
    func expenseAdded(atIndexPath: IndexPath) {
        self.tableView.insertRows(at: [atIndexPath], with: UITableView.RowAnimation.middle)
    }
    
    func expenseDeleted(atIndexPath: IndexPath) {
        self.tableView.deleteRows(at: [atIndexPath], with: UITableView.RowAnimation.middle)
    }
    
    func expenseUpdated(atIndexPath: IndexPath) {
        self.tableView.selectRow(at: atIndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
}
