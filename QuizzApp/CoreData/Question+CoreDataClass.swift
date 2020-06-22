//
//  Question+CoreDataClass.swift
//  
//
//  Created by Borna on 19/06/2020.
//
//

import Foundation
import CoreData

@objc(Question)
public class Question: NSManagedObject {
    
    class func getEntityName() -> String {
        return "Question"
    }
    
    static func firstOrCreate(withId id: Int) -> Question? {
        let context = DataController.shared.persistentContainer.viewContext
        let request: NSFetchRequest<Question> = Question.fetchRequest()
        request.predicate = NSPredicate(format: "id = %d", id)
        request.returnsObjectsAsFaults = false
        
        do {
            let questions = try context.fetch(request)
            if let question = questions.first {
                return question
            } else {
                let newQuestion = Question(context: context)
                return newQuestion
            }
        } catch {
            return nil
        }
    }
    
    static func createFrom(from model: QuestionModel) -> Question? {
        guard   let id = model.id,
                let question = model.question,
                let answers = model.answers,
                let correctAnswer = model.correctAnswer  else {return nil}
        
        guard let questionn = Question.firstOrCreate(withId: id) else {return nil}
        questionn.id = Int64(id)
        questionn.question = question
        questionn.answears = answers
        questionn.correctAnswear = Int64(correctAnswer)
        do {
            let context = DataController.shared.persistentContainer.viewContext
            try context.save()
            return questionn
        } catch let err{
            print(err.localizedDescription)
        }
        return nil
    }
}






