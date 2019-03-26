//
//  Travel.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Travel {

    var name : String {
        get {
            return self.pname ?? ""
        }
        set {
            self.pname = newValue
        }
    }
    var picture : UIImage? {
        get {
            guard let image = self.pimage else { return nil }
            return UIImage(data: image)
        }
        set {
            self.pimage = newValue?.pngData()
        }
    }
    
    public convenience init(name: String, picture: UIImage?) {//, persons: Travellers, expences: ExpensesSet)
        self.init(context: CoreDataManager.context)
        self.pname = name;
        self.picture = picture
    }
    
}

class ViewModelTravelTable {
    public var travelFetched : NSFetchedResultsController<Travel>
    public init(data : NSFetchedResultsController<Travel>){
        self.travelFetched = data
    }
    
    public var count : Int {
        return self.travelFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(travelAt: Int) -> Travel? {
        return self.travelFetched.object(at: IndexPath(row: travelAt, section: 0))
    }
    
    public func add(travel: Travel){
        //TODO On ne vérifie pas qu'un utilisateur existe déjà
        let indexPath = self.travelFetched.indexPath(forObject: travel)
    }
    
    public func delete(travelAt: Int){
        guard let travel = get(travelAt: travelAt) else { return }
        CoreDataManager.context.delete(travel)
    }
    
    
}
