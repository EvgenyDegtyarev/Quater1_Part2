//
//  FriendPhotoViewCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class FriendPhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendsPhotoImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    private var likeCounter = 0
    
    @IBAction func isLikedButton(_ sender: Any) {
        
        likeButton.isSelected.toggle()
        animation()
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 5.0
    
    override func awakeFromNib() {
       // self.layer.cornerRadius = 75.0
        //self.layer.masksToBounds = true
        //self.layer.borderWidth = borderWidth
        
        
        configureLike()
    }
    
    private func configureLike() {
        self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        self.likeButton.setTitle(String(likeCounter), for: .normal)
        self.likeButton.setTitle(String(likeCounter+1), for: .selected)
    }
    
    func animation() {
        UIView.transition(with: friendsPhotoImage,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft, .curveEaseInOut]) {
            
        } 
 
    }
    


class AvatarBackShadow: UIView {
    @IBInspectable var shadowColor: UIColor = .darkGray
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5.0, height: -3)
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


}
