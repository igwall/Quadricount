//
//  TravelPageViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 31/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class TravelPageViewController : UIViewController {
    
    var currentTravel : Travel!
    
    @IBOutlet weak var travelName: UILabel!
    @IBOutlet weak var travelImage: UIImageView!
    
    //We have to use this function cause viewDidLoad is launched BEFORE the TabBarController fills the currentTravel variable
    func initialize(){
        travelName.text = currentTravel.name
        travelImage.image = currentTravel.picture
    }
}
