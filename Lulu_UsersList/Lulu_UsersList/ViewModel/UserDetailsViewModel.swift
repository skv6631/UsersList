//
//  UserDetailsViewModel.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation
import UIKit
class UserDetailsViewModel:NSObject {
    var controller:UserDetailsViewController!
    var user:User?
    func setupViews() {
        let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleSaveAction))
        controller.navigationItem.rightBarButtonItem = save
        controller.navigationItem.rightBarButtonItem?.isEnabled = false
        setupUI()
    }
    func setupUI () {
        controller.firstName.text = controller.user?.firstName
        controller.lastName.text = controller.user?.lastName
        controller.email.text = controller.user?.email
        if let url = URL(string:user?.avatar ?? "") {
            NetworkManager.sharedInstance.downloadImage(from: url) { [weak self] (image) in
                DispatchQueue.main.async { [weak self] in
                    if let _img = image {
                        self?.controller?.avatarImageView.image = _img
                    }
                }
            }
        }
    }
    @objc func handleSaveAction() {
        self.user?.firstName = controller.firstName.text ?? ""
        self.user?.lastName = controller.lastName.text ?? ""
        if let closure = controller.didSelectSave {
            closure()
            controller.view.endEditing(true)
            controller.navigationController?.popViewController(animated: true)
        }
    }
    
    
}

