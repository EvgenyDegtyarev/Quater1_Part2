//
//  FriendPhotoViewCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class FriendPhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendsPhotoImage: UIImageView!
    
    @IBInspectable var borderColor: UIColor = .blue
    @IBInspectable var borderWidth: CGFloat = 5.0
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 75.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

class AvatarBackShadow: UIView {
    @IBInspectable var shadowColor: UIColor = .lightGray
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: -3)
    @IBInspectable var shadowOpacity: Float = 10.0
    @IBInspectable var shadowRadius: CGFloat = 10.0
    
    
    override func awakeFromNib() {
        self.backgroundColor = .clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
 
}
