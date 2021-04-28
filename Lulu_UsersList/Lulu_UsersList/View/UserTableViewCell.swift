//
//  ContactTableViewCell.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var emailLabel:UILabel!
    
    static let identifier = "UserTableViewCell"
    static func nib()-> UINib {
        return UINib(nibName: "UserTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    /// Prepares the cell for the provided model object 
    /// - Parameter contact: object of Contact class
    func setupCell(user:User, _ indexPath:IndexPath){
        setupUI()
        if indexPath.row % 2 == 1 {
        //odd row
            if let url = URL(string:user.avatar) {
                NetworkManager.sharedInstance.downloadImage(from: url) { [weak self] (image) in
                    DispatchQueue.main.async {
                        if let _img = image {
                            self?.avatar.setImage(_img, for: .normal)
                            self?.avatar.setTitle(nil, for: UIControl.State.normal)
                        }
                    }

                }
            }

        } else {
            //even row
            let initials = String(user.firstName.prefix(1)  + user.lastName.prefix(1))
            self.avatar.setTitle(initials, for: UIControl.State.normal)
            self.avatar.setImage(nil, for: .normal)


        }
        self.emailLabel.text = user.email
        self.nameLabel.text = user.firstName + " " + user.lastName
    }
    /// Uses for applying UI properties like color, font, etc..
    fileprivate func setupUI() {
        self.emailLabel.textColor = .gray
        self.emailLabel.font = UIFont.systemFont(ofSize: 14)
        avatar.imageView?.contentMode = .scaleAspectFill
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.makeCircle()
    }
  
    
}
