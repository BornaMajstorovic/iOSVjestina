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
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let endPoint = "username=\(username)&password=\(password)"
        request.httpBody = endPoint.data(using: .utf8)
        
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

