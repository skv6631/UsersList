//
//  UserDetailsViewController.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    var user:User?
    var indexPath:IndexPath?
    var didSelectSave: (() -> (Void))?
    override func viewDidLoad() {
        super.viewDidLoad()
        let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleSaveAction))
        self.navigationItem.rightBarButtonItem = save
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        setupViews()
    }
    func setupViews() {
        self.firstName.text = self.user?.firstName
        self.lastName.text = self.user?.lastName
        self.email.text = self.user?.email
        if let url = URL(string:user?.avatar ?? "") {
            NetworkManager.sharedInstance.downloadImage(from: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let _img = image {
                        self?.avatarImageView.image = _img
                    }
                }

            }
        }

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.makeCircle()
    }
    @objc func handleSaveAction() {
        self.user?.firstName = self.firstName.text ?? ""
        self.user?.lastName = self.lastName.text ?? ""
        
        if let closure = didSelectSave {
            closure()
            self.view.endEditing(true)
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = (user?.firstName ?? "") + " " + (user?.lastName ?? "")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = nil
    }
    


}
extension UserDetailsViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
}
