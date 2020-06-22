//
//  QuizzesService.swift
//  QuizzApp
//
//  Created by Borna on 10/04/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation
import UIKit

class QuizzesService {
    
   
    func fetchQuizzes(completion: @escaping ((Result<AllQuizzes, Error>)->Void)){
        
        let urlString = Constants.baseUrl + "/quizzes"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data,response,err) in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(AllQuizzes.self, from: data)
                    //core data stuff
                    let quizArr = model.quizzes
                    var quizzes: [Quiz] = []
                    quizArr.forEach {
                        if let quiz = Quiz.createFrom(from: $0) {
                            quizzes.append(quiz)
                        }
                    }
                    completion(.success(model))
                } catch let decodeErr {
                    completion(.failure(decodeErr))
                }
            }
            if let err = err {
                completion(.failure(err))
                return
            }
        }.resume()
        
    }
    
    func fetchScores(quizId: Int, completion: @escaping ((Result<[ScoreModel], Error>)->Void)){
        
        let urlString = Constants.baseUrl + "/score?quiz_id=\(quizId)"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        guard let token = UserDefaults.standard.string(forKey: "token") else{return}
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        URLSession.shared.dataTask(with: request){ (data,response,err) in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode([ScoreModel].self, from: data)
                    completion(.success(model))
                } catch let decodeErr {
                    completion(.failure(decodeErr))
                    return
                }
            }
            
        }.resume()
        
    }
    
    func sendResult(quizId: Int, time: Double, numOfCorrect: Int, completion: @escaping ((HTTPStatus?) -> Void)){
        let urlString = Constants.baseUrl + "/result"
        
        guard let url = URL(string: urlString) else {return}
        guard let token = UserDefaults.standard.string(forKey: "token") else {return}
        guard let userId = UserDefaults.standard.string(forKey: "user") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
            
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "quiz_id": quizId,
            "user_id": userId,
            "time": time,
            "no_of_correct": numOfCorrect
        ]//isto odvojit u api constants
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request){(data,response,err) in
            if let res = response as? HTTPURLResponse {
                completion(HTTPStatus(rawValue: res.statusCode))
            } else {
                completion(nil)
            }
        }.resume()
    }
}

enum HTTPStatus: Int {
    case OK = 200
    case BADREQUEST = 400
    case UNAUTHORIZED = 401
    case FORBIDDEN = 403
    case NOTFOUND = 404
}
