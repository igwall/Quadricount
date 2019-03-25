//
//  TravelFetchResultController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import UIKit
import CoreData

class TravelFetchResultController : NSObject, NSFetchedResultsControllerDelegate {
    let tableView : UITableView
    
    init(view: UITableView){
        self.tableView = view
        super.init()
        do {
            try self.travelFetched.performFetch()
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var travelFetched : NSFetchedResultsController<Travel> = getFetchRequestController()
    
    private func getFetchRequestController() -> NSFetchedResultsController<Travel> {
        let request : NSFetchRequest<Travel> = Travel.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Travel.pname),ascending:true)]
        let fetchRequestController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchRequestController.delegate = self
        return fetchRequestController
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.endUpdates()
        CoreDataManager.save()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at
        indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } default:
            break
        }
        
    }
    
}
