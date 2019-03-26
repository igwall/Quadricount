//
//  TravellerTableViewController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravellerTableViewController : NSObject, UITableViewDataSource {
    
    var table: UITableView
    var fetchResultController : TravellerFetchResultController
    var data : ViewModelTravellerTable
    
    
    init(tableView: UITableView){
        self.table = tableView
        self.fetchResultController = TravellerFetchResultController(view: tableView)
        self.data = ViewModelTravellerTable(data: fetchResultController.travellerFetched)
        super.init()
        self.table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travellerCell", for: indexPath) as! TravellerCell
        if let traveller = self.data.get(travellerAt: indexPath.row){
            cell.fullName.text = traveller.fullname
        }
        return cell
    }
    
    func add(traveller: Traveller){
        self.data.add(traveller: traveller)
    }
    
}
