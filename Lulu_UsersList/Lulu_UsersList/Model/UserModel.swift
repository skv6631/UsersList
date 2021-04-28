//
//  UserModel.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation

//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

// MARK: - Users
class Users: Codable {
    var data: [User]
}

// MARK: - Datum
class User: Codable {
    var id: Int
    var email, firstName, lastName: String
    var avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
