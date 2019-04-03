//
//  ContributionCell.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class ContributionCell : UITableViewCell {
    
    var traveller : Traveller!
    
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountField: UITextField!
}
