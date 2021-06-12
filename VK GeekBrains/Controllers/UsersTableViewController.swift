//
//  UsersTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit
import RealmSwift



class UsersTableViewController: UITableViewController {
    
    let networkService = NetworkService()
    var friendsData = [VKUser] ()
    var nextData = 0
    
    let users = try? RealmService.load(typeOf: RealmUser.self)
    
    var friends = [User(name: "Евгений",
                        surname: "Дегтярев",
                        avatar: UIImage(named: "EvgenyDegtyarev"),
                        images: [UIImage(named: "ev1"),
                                 UIImage(named: "ev2"),
                                 UIImage(named: "ev3"),
                                 UIImage(named: "ev4"),
                                 UIImage(named: "ev5"),
                                 UIImage(named: "ev6")]),
                 
    ]
    
    var searchFriends = [User]()
    var isSearching = false
    
    
    var sortedUsers: [Character: [User]] = [:]
    var firstLetters =  [Character]()
    
    func sortUsers (_ users: [User]) -> (characters: [Character], sortedUsers: [Character: [User]]){

            var characters = [Character]()
            var sortedUsers = [Character: [User]]()

            self.friends.forEach { user in
                guard let firstLetter = user.surname.first else {return}

                if var letterInUsers = sortedUsers[firstLetter]{
                    letterInUsers.append(user)
                    sortedUsers[firstLetter] = letterInUsers
                } else {
                    sortedUsers[firstLetter] = [user]
                    characters.append(firstLetter)
                }
            }
            characters.sort()

            return (characters, sortedUsers)
     
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*  networkService.getFriends(Session.instance.myID, "", "1", "first_name,last_name,photo_200_orig,id,last_seen") { [weak self] response in
            // 🚩Here
            self?.friendsData = response
            self?.tableView.reloadData()
        } */
        networkService.getUserFriends { [weak self] vkFriends in
            guard
                let self = self,
                let friends = vkFriends
            else { return }
            try? RealmService.save(items: friends)
        }
        
        let nib = UINib(nibName: "FriendCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FriendCell")
        
        (firstLetters, sortedUsers) = sortUsers(friends)
        
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return !isSearching ? firstLetters.count : 1
    }
    
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if !isSearching {
              let letter = firstLetters[section]
            return sortedUsers[letter]?.count ?? 0
          } else {
              return searchFriends.count
          }
      }
   

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { return UITableViewCell()}
        
        if !isSearching {
            let letter = firstLetters[indexPath.section]
            if let userArraybyKey = sortedUsers[letter] {
                let currentUser = userArraybyKey[indexPath.row]
                cell.configure(fullname: currentUser.fullname,
                               image: currentUser.avatar)
            }
        } else {
            let currentUser = searchFriends[indexPath.row]
            cell.configure(fullname: currentUser.fullname,
                           image: currentUser.avatar)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !isSearching {
            return "\(firstLetters[section])"
        } else {
            return "Найдены пользователи"
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        firstLetters.map { "\($0)" }
    }
    
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showUserPhotos",
            let destination = segue.destination as? FriendsPhotoCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        destination.userImages = [friends[index].avatar]
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(identifier)
        return true
    } */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        guard let friendPhotosVC = UIStoryboard(
                name: "Main",
                bundle: nil)
            .instantiateViewController(identifier: "FriendsPhotoCollectionViewController")
                as? FriendsPhotoCollectionViewController
        else { return }
        if !isSearching {
            let userLetter = firstLetters[indexPath.section]
            if let user = sortedUsers[userLetter]?[indexPath.row] {
            //friendPhotosVC.userImages = [user.avatar]
                friendPhotosVC.userImages = user.images
            }
        } else {
            let user = searchFriends[indexPath.row]
            friendPhotosVC.userImages = user.images
    }
    navigationController?.pushViewController(friendPhotosVC, animated: true)
}
}
extension UsersTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        defer { tableView.reloadData() }
        if !searchText.isEmpty {
            searchFriends = friends.filter { $0.fullname.contains(searchText) }
            isSearching = true
        } else {
            isSearching = false
        }
        
    }
 
   
}
