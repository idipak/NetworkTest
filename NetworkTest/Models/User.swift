//
//  User.swift
//  NetworkTest
//
//  Created by Codebucket on 09/09/22.
//

import Foundation

struct User: Codable, Identifiable{
    let id: Int
    let name, email : String
}


