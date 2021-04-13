//
//  FriendsPhotoCollectionViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit



class FriendsPhotoCollectionViewController: UICollectionViewController {

    var userImages = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell",
                                                            for: indexPath) as? FriendPhotoViewCell
        else { return UICollectionViewCell() }
        cell.friendsPhotoImage.image = userImages[indexPath.item]
        
        return cell
    }

}
