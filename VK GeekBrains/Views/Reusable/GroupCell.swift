//
//  GroupCell.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groupImageView.image = nil
        groupNameLabel.text = nil
    }
    
    func configure(
        imageURL: String,
        name: String) {
        groupImageView.kf.setImage(with: URL(string: imageURL))
        groupNameLabel.text = name
    }
   
}
