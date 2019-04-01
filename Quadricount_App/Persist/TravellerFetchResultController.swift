//
//  TravellerFetchResultController.swift
//  Quadricount_App
//
//  Created by Lucas Goncalves  on 26/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import UIKit
import CoreData

class TravellerFetchResultController : NSObject, NSFetchedResultsControllerDelegate {
    let tableView : UITableView
    let travel : Travel
    init(view: UITableView, travel: Travel){
        self.tableView = view
        self.travel = travel
        super.init()
        do {
            try self.travellerFetched.performFetch()
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var travellerFetched : NSFetchedResultsController<Traveller> = getFetchRequestController()
    
    private func getFetchRequestController() -> NSFetchedResultsController<Traveller> {
        let request : NSFetchRequest<Traveller> = Traveller.fetchRequest()
        request.predicate = NSPredicate(format: "ptravel.pname == %@" , self.travel.name )
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Traveller.pperson.pfirstname),ascending:true),NSSortDescriptor(key:#keyPath(Traveller.pperson.plastname),ascending:true)]
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
            }
        default:
            break
        }
        
    }
    
}
