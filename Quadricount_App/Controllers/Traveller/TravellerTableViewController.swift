//
//  TravellerTableViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravellerTableViewController : NSObject, UITableViewDataSource, UITableViewDelegate, TravellerSetModelDelegate{
    
    var table: UITableView
    var data : TravellerSet
    var travel : Travel
    
    
    init(tableView: UITableView, travel: Travel){
        self.table = tableView
        self.travel = travel
        self.data = TravellerSet(travel: travel)
        super.init()
        self.data.subscribe(observer: self)
        self.table.dataSource = self
        self.table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "travellerCell", for: indexPath) as! TravellerCell
        if let traveller = self.data.get(travellerAt: indexPath.row){
            cell.fullName.text = traveller.fullname
            cell.beginDate.text = formatter.string(for: traveller.beginDate)
            if traveller.endDate != nil{
                cell.endDate.text = formatter.string(for: traveller.endDate!)
            } else {
                cell.endDate.text = "No data"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // MARK: TravellerSet Model Delegate functions
    
    func travellerAdded(atIndexPath: IndexPath) {
        self.table.insertRows(at: [atIndexPath], with: UITableView.RowAnimation.middle)
    }
    
    func travellerDeleted(atIndexPath: IndexPath) {
        self.table.deleteRows(at: [atIndexPath], with: UITableView.RowAnimation.middle)
    }
    
    func travellerUpdated(atIndexPath: IndexPath) {
        self.table.selectRow(at: atIndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
}
