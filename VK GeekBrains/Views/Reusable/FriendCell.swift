//
//  FriendCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.04.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendPhotoImage: AvatarImage!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    func configure(
        fullname: String,
        image: UIImage?) {
        friendNameLabel.text = fullname
        friendPhotoImage.image = image
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
