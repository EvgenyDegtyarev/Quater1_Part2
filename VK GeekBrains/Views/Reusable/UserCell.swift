//
//  UserCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userAvatarImage.image = nil
        userNameLabel.text = nil
    }
    
    func configure(
        imageURL: String,
        name: String) {
        userAvatarImage.kf.setImage(with: URL(string: imageURL))
        userNameLabel.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        userAvatarImage.layer.cornerRadius = userAvatarImage.bounds.height / 2
        userAvatarImage.layer.masksToBounds = true
        }
    }


