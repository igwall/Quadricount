//
//  TravelTableViewControiller.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 23/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelTableViewController : NSObject, UITableViewDataSource {
    
    var table : UITableView
    var fetchResultController : TravelFetchResultController
    var data : ViewModelTravelTable
    
    init(tableView: UITableView){
        self.table = tableView
        self.fetchResultController = TravelFetchResultController(view: tableView)
        self.data = ViewModelTravelTable(data: fetchResultController.travelFetched)
        super.init()
        self.table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath)
        if let travel = self.data.get(travelAt: indexPath.row){
            cell.textLabel?.text = travel.name
        }
        return cell
        
    }
    
    func add(travel : Travel){
        self.data.add(travel: travel)
    }
    
}
