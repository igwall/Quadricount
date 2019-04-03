//
//  TravelLastExpensesViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 03/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelLastExpensesViewController :  NSObject, UITableViewDataSource {
    
    let table : UITableView!
    let currentTravel : Travel
    let expenses : ExpenseSet
    
    init(table : UITableView, travel: Travel){
        self.table = table
        self.currentTravel = travel
        self.expenses = travel.expenses
        super.init()
        self.table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count > 5 ? 5 : expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseCell
        if let exp = expenses.get(at: indexPath.row) {
            cell.expenseTitle.text = exp.name
            cell.expenseAmount.text = exp.amount.description
        }
        return cell
    }
    
}
