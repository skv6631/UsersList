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
    var viewModel = UserDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.controller = self
        viewModel.user = self.user
        viewModel.setupViews()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.makeCircle()
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
