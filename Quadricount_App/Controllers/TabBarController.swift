//
//  TabBarController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 29/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TabBarController : UITabBarController , UITabBarControllerDelegate{
    
    var travel : Travel!
    
    override func viewDidLoad() {
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let controller = viewController as? TravellerViewController {
            controller.travel = self.travel
            controller.initializeController()

        }
    }
    
}
