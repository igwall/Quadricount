//
//  DebtCell.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 01/04/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class DebtCell : UITableViewCell {
    
    var debt : Debt?
    
    @IBOutlet weak var giverFirstname: UILabel!
    @IBOutlet weak var receiverFirstname: UILabel!
    @IBOutlet weak var amount: UILabel!
    
}
