//
//  TravelTableViewControiller.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 23/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelTableViewController : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var table : UITableView
    var fetchResultController : TravelFetchResultController
    var data : ViewModelTravelTable
    var upperController : UIViewController
    
    init(tableView: UITableView, upperController: UIViewController){
        self.table = tableView
        self.upperController = upperController
        self.fetchResultController = TravelFetchResultController(view: tableView)
        self.data = ViewModelTravelTable(data: fetchResultController.travelFetched)
        super.init()
        self.table.dataSource = self
        self.table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelCell
        if let travel = self.data.get(travelAt: indexPath.row){
            cell.travelName?.text = travel.name
            
            if let picture = travel.picture {
                cell.travelImage?.image = picture
            }
            
            cell.balancedImage.image = travel.balanced ? UIImage(named: "balanced") : UIImage(named: "not-balanced") 
            
            /*let url = URL(string: "https://i.pinimg.com/736x/6c/7f/87/6c7f877678abf1091a343c06edebd937--avatar-james-cameron-pandora.jpg")
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                cell.travelImage?.image = UIImage(data: imageData)
            }*/
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let travel = self.data.get(travelAt: indexPath.row){
            if let controller = self.upperController as? TravelViewController {
                controller.selectedTravel = travel
                controller.performSegue(withIdentifier: "selectedTravel", sender: self)
            }
        }
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
