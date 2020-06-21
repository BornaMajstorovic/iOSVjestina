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
        request.predicate = NSPredicate(format: "id = %@", id)
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
    
    //    static func createFrom(json: [String: Any]) -> Question? {
    //        guard   let id = json["id"] as? Int,
    //                let question = json["question"] as? String,
    //                let answers = json["answers"] as? [String],
    //                let correctAnswer = json["correct_answer"] as? Int else {return nil}
    //
    //        guard let quest = Question.firstOrCreate(withId: id) else {return nil}
    //        quest.id = Int64(id)
    //        quest.question = question
    //        quest.answears = answers
    //        quest.correctAnswear = Int64(correctAnswer)
    //        return quest
    //
    //    }
    static func createFrom(from model: QuestionModel) -> Question? {
        guard  let id = model.id,
            let question = model.question,
            let answers = model.answers,
            let correctAnswer = model.correctAnswer  else {return nil}
        
        guard let questionn = Question.firstOrCreate(withId: id) else {return nil}
        questionn.id = Int64(id)
        questionn.question = question
        questionn.answears = answers
        questionn.correctAnswear = Int64(correctAnswer)
        return questionn
        
    }
}






