//
//  StringExtension.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation
extension String {
    func isValidURL () -> Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
    }
}

