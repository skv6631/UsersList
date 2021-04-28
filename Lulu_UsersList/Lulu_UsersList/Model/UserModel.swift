//
//  UserModel.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation

//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

// MARK: - Users
struct Users: Codable {
    let data: [User]
}

// MARK: - Datum
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
