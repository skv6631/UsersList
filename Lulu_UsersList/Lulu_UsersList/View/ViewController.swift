//
//  ViewController.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = UsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.controller = self
        viewModel.tableView = self.tableView
        viewModel.setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Users List"
    }


}

