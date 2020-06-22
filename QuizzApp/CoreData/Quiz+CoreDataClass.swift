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
        request.predicate = NSPredicate(format: "id = %d", id)
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
    
    class func createFrom(from model: QuizModel) -> Quiz? {
        guard   let id = model.id,
                let title = model.title,
                let category = model.category,
                let description = model.description,
                let level = model.level,
                let questions = model.questions else {return nil}
        
        guard let quiz = Quiz.firstOrCreate(withId: id) else {return nil}
        quiz.id = Int64(id)
        quiz.title = title
        quiz.level = Int64(level)
        quiz.category = Category(rawValue: category)!.rawValue
        quiz.descript = description
        quiz.imageUrl = model.image
        
        questions.forEach { (questionModel) in
            guard let quest = Question.createFrom(from: questionModel) else{return}
            quiz.addToQuestions(quest)
        }
        
        do {
            let context = DataController.shared.persistentContainer.viewContext
            try context.save()
            return quiz
        } catch let err {
            print(err.localizedDescription)
        }
        return nil
    }
    
        

}

