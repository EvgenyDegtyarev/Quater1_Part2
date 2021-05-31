//
//  FullPhotoController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 13.05.2021.
//

import UIKit
import Alamofire

class FullPhotoController: UIViewController {

    var userImages = [UIImage?]()
    var imageIndex = 0
    
    @IBOutlet weak var fullPhotoImage: UIImageView!
    @IBOutlet weak var fullSecondPhotoImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = userImages[imageIndex] {
            fullPhotoImage.image = image
        }
    }
}


