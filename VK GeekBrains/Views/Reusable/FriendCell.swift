//
//  FriendCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.04.2021.
//

import UIKit

protocol UserCellDelegate: AnyObject {
    func didPressUpdate(indexpath: IndexPath)
}

class FriendCell: UITableViewCell {
    weak var delegate: UserCellDelegate?
    
    @IBOutlet weak var friendPhotoImage: AvatarImage!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    @IBAction func someButton() {
        delegate?.didPressUpdate(indexpath: IndexPath(item: 0, section: 0))
    }
    
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
