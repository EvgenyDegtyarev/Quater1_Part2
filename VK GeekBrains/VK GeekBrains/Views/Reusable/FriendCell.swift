//
//  FriendCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.04.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendPhotoImage: AvatarImage!
    
    @IBOutlet weak var friendNameLabel: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
