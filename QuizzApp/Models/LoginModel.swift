//
//  LoginModel.swift
//  QuizzApp
//
//  Created by Borna on 10/05/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import Foundation

struct LoginModel: Decodable {
    var token: String?
    var userId: Int?
    
    enum CodingKeys: String, CodingKey {
        case token
        case userId = "user_id"
    }
}
