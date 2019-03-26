//
//  Expense.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

extension Expense {
    
    public var name : String {
        get {
            return self.pname ?? ""
        }
        
        set {
            self.pname = newValue
        }
    }
    
    public var picture : UIImage? {
        get {
            guard let data = self.pimage else { return nil }
            return UIImage(data: data)
        }
        set {
            self.pimage = newValue?.pngData()
        }
    }
    
}
