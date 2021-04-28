//
//  UsersViewModel\.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation
import UIKit
class UsersViewModel:NSObject {
    var controller:ViewController!
    private var users:Users?
    var tableView: UITableView!
    func setupViews() {
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 56
        tableView.tableFooterView = UIView()
        getUsers()
    }
    func getUsers() {
        NetworkManager.sharedInstance.getUsers { [weak self](list) in
            self?.users = list
            self?.reloadTable()
        }
    }
}

//MARK:- Tableveiw Delegatets
extension UsersViewModel:UITableViewDelegate,UITableViewDataSource {
    private func reloadTable(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as? UserTableViewCell {
            if let user = users?.data[indexPath.row]{
                cell.setupCell(user: user, indexPath)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
