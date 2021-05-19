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
    
    func configure( image: UIImage?,name: String ) {
        groupImageView.image = image
        groupNameLabel.text = name
    }
   
}
