//
//  DataController.swift
//  QuizzApp
//
//  Created by Borna on 18/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    static let shared = DataController()
    private init(){}
    
    //ulazna tocka prema Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err as NSError? {
                fatalError("Unresolved error \(err), \(err.userInfo)")
            }
        }
        return container
    }()
    
    func fetchQuizzes()-> [Quiz]?{
        let request: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let context = DataController.shared.persistentContainer.viewContext
        let quizzes = try? context.fetch(request)
        return quizzes
    }
    
    func fetchSearchQuizzes(key: String)-> [Quiz]?{
        let request: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        if key != "" {
            let titlePredicate: NSPredicate = NSPredicate(format: "title CONTAINS[c] %@", key)
            let descriptionPredicate: NSPredicate = NSPredicate(format: "descript CONTAINS[c] %@", key)
            request.predicate = NSCompoundPredicate(orPredicateWithSubpredicates:  [titlePredicate, descriptionPredicate])
        }
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let context = DataController.shared.persistentContainer.viewContext
        let quizzes = try? context.fetch(request)
        return quizzes
    }
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

  
    

