//
//  PersonFetchResultController.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 22/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import UIKit
import CoreData

class PersonFetchResultController : NSObject, NSFetchedResultsControllerDelegate {
    let tableView : UITableView
    
    init(view: UITableView){
        self.tableView = view
        super.init()
        do {
            try self.personFetched.performFetch()
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var personFetched : NSFetchedResultsController<Person> = getFetchRequestController()
        
    private func getFetchRequestController() -> NSFetchedResultsController<Person> {
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.plastname),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstname)
                ,ascending:true)]
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
