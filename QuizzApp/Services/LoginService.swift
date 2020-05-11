//
//  LoginService.swift
//  QuizzApp
//
//  Created by Borna on 09/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation


class LoginService {
    func loginUserWith(username: String, password: String, completion: @escaping ((Result<LoginModel, Error>) -> Void)) {
        
        let urlString = "https://iosquiz.herokuapp.com/api/session"
        
        guard let url = URL(string: urlString) else { return }
        
        let items = ["username" : username, "password" : password]
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        var queryItems:[URLQueryItem] = []
        items.forEach({ (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        })
        components?.queryItems = queryItems
        
        if let url = components?.url {
            var request = URLRequest(url:url)
            request.httpMethod = "POST"
            URLSession.shared.dataTask(with: request) {(data, resp, err) in
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(LoginModel.self, from: data)
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
    }
    
    //NE VALJA
    //    func loginUserWith(username: String, password: String, completion: @escaping ((Result<LoginModel, Error>) -> Void)) {
    //
    //        let urlString = "https://iosquiz.herokuapp.com/api/session"
    //
    //        guard let url = URL(string: urlString) else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //
    //        let data = ["username" : username, "password" : password]
    //        let jsonData = try? JSONSerialization.data(withJSONObject: data)
    //
    //        request.httpBody = jsonData
    //
    //        URLSession.shared.dataTask(with: request) {(data, resp, err) in
    //            if let data = data {
    //                do {
    //                    let model = try JSONDecoder().decode(LoginModel.self, from: data)
    //                    completion(.success(model))
    //                } catch let decodeErr {
    //                    completion(.failure(decodeErr))
    //                }
    //            }
    //            if let err = err {
    //                completion(.failure(err))
    //                return
    //            }
    //        }.resume()
    //    }
}






