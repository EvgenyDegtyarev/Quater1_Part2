//
//  UserCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userAvatarImage: UIImageView!
    

    @IBOutlet weak var userNameLabel: UILabel!
    
    func configure(image: UIImage?, name: String) {
        userAvatarImage.image = image
        userNameLabel.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        userAvatarImage.layer.cornerRadius = userAvatarImage.bounds.height / 2
        userAvatarImage.layer.masksToBounds = true
        }
    }


