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
        
        //DidSelect is not called initially so we force the call so that interface is correctly initialized
        self.selectedIndex = 0
        if let controller = self.selectedViewController {
            self.tabBarController(self, didSelect: controller)
        }
    }
    
    // We have to use this function because viewDidLoad is called before the TravelViewController fills the travel variable.
    // Plus this function is called for the first appearance of the tab bar. DidSelect isn't called during first appearance so we force the initialization of TravelPageViewController's variable
    func firstCall(){
        if let controller = self.selectedViewController as? TravelPageViewController {
                controller.currentTravel = self.travel
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let controller = viewController as? TravellerViewController {
            controller.travel = self.travel
            controller.initializeController()
        }
        
        if let controller = viewController as? TravelPageViewController {
            controller.currentTravel = self.travel
            controller.initialize()
        }
    }
    
    
}
