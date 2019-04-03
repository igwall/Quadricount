//
//  StateTableViewDelegate.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 03/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class StateTableViewDelegate : NSObject, UITableViewDelegate {
    
    var tableView : UITableView
    
    init(tableView: UITableView){
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.get
    }
}
