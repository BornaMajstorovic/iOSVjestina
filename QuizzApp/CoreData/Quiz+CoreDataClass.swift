//
//  Quiz+CoreDataClass.swift
//  
//
//  Created by Borna on 19/06/2020.
//
//

import Foundation
import CoreData

@objc(Quiz)
public class Quiz: NSManagedObject {
    
    class func getEntityName() -> String {
        return "Quiz"
    }
    
    class func firstOrCreate(withId id: Int)-> Quiz?{
        let context = DataController.shared.persistentContainer.viewContext
        let request: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id)
        request.returnsObjectsAsFaults = false
        do {
            let quizzes = try context.fetch(request)
            if let quiz = quizzes.first {
                return quiz
            } else {
                let newQuiz = Quiz(context: context)
                return newQuiz
            }
        } catch {
            return nil
        }
    }
    
    class func createFrom(json: [String: Any]) -> Quiz? {
        guard   let id = json["id"] as? Int,
                let title = json["title"] as? String,
                let category = json["category"] as? String,
                let description = json["description"] as? String?,
                let level = json["level"] as? Int,
                let questionsJson = json["questions"] as? [[String: Any]] else {return nil}
        
        guard let quiz = Quiz.firstOrCreate(withId: id) else {return nil}
        quiz.id = Int64(id)
        quiz.title = title
        quiz.level = Int64(level)
        quiz.category = Category(rawValue: category)!.rawValue
        quiz.descript = description
        quiz.imageUrl = json["image"] as? String
        
        questionsJson.forEach { (json) in
            guard let quest = Question.createFrom(json: json) else{return}
            quiz.addToQuestions(quest)
        }
        
        do {
            let context = DataController.shared.persistentContainer.viewContext
            try context.save()
            return quiz
        } catch {
            print("Failed saving")
        }
        return nil
    }
    
        

}

