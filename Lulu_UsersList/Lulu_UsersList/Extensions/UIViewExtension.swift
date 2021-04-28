//
//  UIViewExtension.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation
import UIKit

extension UIView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = false
        self.clipsToBounds = true

    }
}
