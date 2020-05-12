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
    
    func fetchQuizzes(urlString: String, completion: @escaping ((Result<AllQuizzes, Error>)->Void)){
        
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data,response,err) in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(AllQuizzes.self, from: data)
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
    
    


// TODO: probat i ovo natjerat da radi
//    func fetchQuizzes(urlString: String, completion: @escaping ((QuizModel?)->Void)){
//
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)

//            let dataTask = URLSession.shared.dataTask(with: request) { (data,response,error) in
//                if let data = data {
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        let quiz = QuizModel(json: json)
//                        completion(quiz)
//                    }
//                    catch{
//                        completion(nil)
//                    }
//
//                } else {
//                    completion(nil)
//                }
//
//            }
//            dataTask.resume()
//        } else {
//            completion(nil)
//        }
//
//    }
//


}
