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
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelCell
        if let travel = self.data.get(travelAt: indexPath.row){
            cell.travelName?.text = travel.name
            cell.travelImage?.image = travel.picture
            
            /*let url = URL(string: "https://i.pinimg.com/736x/6c/7f/87/6c7f877678abf1091a343c06edebd937--avatar-james-cameron-pandora.jpg")
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                cell.travelImage?.image = UIImage(data: imageData)
            }*/
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.data.delete(travelAt: indexPath.row)
        }
    }
    
    func add(travel : Travel){
        self.data.add(travel: travel)
    }
    
}
