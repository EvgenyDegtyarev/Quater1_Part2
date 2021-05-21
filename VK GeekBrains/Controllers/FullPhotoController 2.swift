//
//  FullPhotoController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 13.05.2021.
//

import UIKit

class FullPhotoController: UIViewController {

    var userImages = [UIImage?]()
    
    @IBOutlet weak var fullPhotoImage: UIImageView!
    @IBOutlet weak var fullSecondPhotoImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullPhotoImage.image = userImages[index]
    }
    
   
}


