//
//  FriendsPhotoCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class FriendsPhotoCell: UICollectionViewCell {
   
    @IBOutlet weak var friendsPhotoCell: UIImageView!
    
    func configure(image: UIImage) {
        friendsPhotoCell.image = image
    }
    
}
