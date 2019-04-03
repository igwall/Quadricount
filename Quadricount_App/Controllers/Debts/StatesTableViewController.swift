//
//  StatesTableViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class StatesTableViewController : NSObject, UITableViewDataSource {
    
    var tableView : UITableView
    var currentTravel : Travel
    var data : StateSetViewModel
    
    init(tableView : UITableView, travel: Travel){
        self.currentTravel = travel
        self.tableView = tableView
        self.data = StateSetViewModel(expenses: currentTravel.expenses)
        super.init()
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath) as! StateCell
        if let state = data.get(at: indexPath.row) {
            cell.firstname.text = state.0.firstname
            cell.amount.text = state.1.description
            if state.1 > 0 {
                cell.amount.textColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
                cell.firstname.textColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
            } else if state.1 < 0 {
                cell.amount.textColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1)
                cell.firstname.textColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1)
            } else {
                //On fait quelque chose si c'est à 0 ?
                cell.amount.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
                cell.firstname.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            }
        }
        return cell
    }    
    
}
