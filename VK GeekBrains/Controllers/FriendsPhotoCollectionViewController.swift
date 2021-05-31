//
//  FriendsPhotoCollectionViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit
import Alamofire


class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    let networkService = NetworkService()
    
    var userImages = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userImages.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell",
                                                            for: indexPath) as? FriendPhotoViewCell
        else { return UICollectionViewCell() }
        cell.friendsPhotoImage.image = userImages[indexPath.item]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "FullPhotoFriend" else { return }
        guard let destination = segue.destination as? FullPhotoController else { return }
        destination.userImages = userImages
        destination.imageIndex = collectionView.indexPathsForSelectedItems?.first?.row ?? 0
    }
}



extension FriendsPhotoCollectionViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
