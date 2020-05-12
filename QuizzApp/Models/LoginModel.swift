//
//  LoginModel.swift
//  QuizzApp
//
//  Created by Borna on 10/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct LoginModel: Decodable {
    var token: String
    var userId: Int
    
    enum CodingKeys: String, CodingKey {
        case token
        case userId = "user_id"
    }
    
    init(from decoder: Decoder) throws{
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.token = try! container.decode(String.self, forKey: CodingKeys.token)
        self.userId = try! container.decode(Int.self, forKey: CodingKeys.userId)
        
    }
}
