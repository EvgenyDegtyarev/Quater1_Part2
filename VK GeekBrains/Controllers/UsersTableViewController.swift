//
//  UsersTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var friends = [User(name: "Евгений",
                        surname: "Дегтярев",
                        avatar: UIImage(named: "EvgenyDegtyarev"),
                        images: [UIImage(named: "ev1"),
                                 UIImage(named: "ev2"),
                                 UIImage(named: "ev3"),
                                 UIImage(named: "ev4"),
                                 UIImage(named: "ev5"),
                                 UIImage(named: "ev6")]),
                    User(name: "Дарья",
                         surname: "Дегтярева",
                         avatar: UIImage(named: "DaryaDegtyareva"),
                         images: [UIImage(named: "dd1"),
                                  UIImage(named: "dd2"),
                                  UIImage(named: "dd3"),
                                  UIImage(named: "dd4"),
                                  UIImage(named: "dd5"),
                                  UIImage(named: "dd6"),
                                  UIImage(named: "dd7"),
                                  UIImage(named: "dd8"),
                                  UIImage(named: "dd9"),]),
                    User(name: "Дмитрий",
                         surname: "Караваев",
                         avatar: UIImage(named: "DmitriKaravaev"),
                         images: [UIImage(named: "dk1"),
                                  UIImage(named: "dk2"),
                                  UIImage(named: "dk3"),
                                  UIImage(named: "dk4"),
                                  UIImage(named: "dk5"),
                                  UIImage(named: "dk6"),]),
                    User(name: "Дарья",
                         surname: "Караваева",
                         avatar: UIImage(named: "DaryaKaravaeva"),
                         images: [UIImage(named: "dak1"),
                                  UIImage(named: "dak2"),
                                  UIImage(named: "dak3"),
                                  UIImage(named: "dak4"),
                                  UIImage(named: "dak5"),
                                  UIImage(named: "dak6"),
                                  UIImage(named: "dak7"),
                                  UIImage(named: "dak8"),
                                  UIImage(named: "dak9"),]),
                    User(name: "Дмитрий",
                         surname: "Калиниченко",
                         avatar: UIImage(named: "DmitriKalinichenko"),
                         images: [UIImage(named: "dim1"),
                                  UIImage(named: "dim2"),
                                  UIImage(named: "dim3"),
                                  UIImage(named: "dim4"),
                                  UIImage(named: "dim5"),
                                  UIImage(named: "dim6"),
                                  UIImage(named: "dim7"),
                                  UIImage(named: "dim8"),]),
                    User(name: "Александра",
                         surname: "Калиниченко",
                         avatar: UIImage(named: "AlexandraKalinichenko"),
                         images: [UIImage(named: "ak1"),
                                  UIImage(named: "ak2"),
                                  UIImage(named: "ak3"),
                                  UIImage(named: "ak4"),
                                  UIImage(named: "ak5"),
                                  UIImage(named: "ak6"),
                                  UIImage(named: "ak7"),
                                  UIImage(named: "ak8"),
                                  UIImage(named: "ak9"),
                                  UIImage(named: "ak10"),
                                  UIImage(named: "ak11"),]),
                    User(name: "Павел",
                         surname: "Прокофьев",
                         avatar: UIImage(named: "PavelProkofiev"),
                         images: [UIImage(named: "pp1"),
                                  UIImage(named: "pp2"),
                                  UIImage(named: "pp3"),
                                  UIImage(named: "pp4"),
                                  UIImage(named: "pp5"),
                                  UIImage(named: "pp6"),
                                  UIImage(named: "pp7"),
                                  UIImage(named: "pp8"),
                                  UIImage(named: "pp9"),]),
                    User(name: "Тамара",
                         surname: "Прокофьева",
                         avatar: UIImage(named: "TomaProkofieva"),
                         images: [UIImage(named: "tp1"),
                                  UIImage(named: "tp2"),
                                  UIImage(named: "tp3"),
                                  UIImage(named: "tp4"),
                                  UIImage(named: "tp5"),
                                  UIImage(named: "tp6"),]),
                    User(name: "Алексей",
                         surname: "Владимиров",
                         avatar: UIImage(named: "AlexeyVladimirov"),
                         images: [UIImage(named: "av1"),
                                  UIImage(named: "av2"),
                                  UIImage(named: "av3"),
                                  UIImage(named: "av4"),
                                  UIImage(named: "av5"),
                                  UIImage(named: "av6"),
                                  UIImage(named: "av7"),
                                  UIImage(named: "av8"),
                                  UIImage(named: "av9"),]),
                    User(name: "Илона",
                         surname: "Владимирова",
                         avatar: UIImage(named: "IlonaVladimirova"),
                         images: [UIImage(named: "iv1"),
                                  UIImage(named: "iv2"),
                                  UIImage(named: "iv3"),
                                  UIImage(named: "iv4"),
                                  UIImage(named: "iv5"),]),
                    User(name: "Валерий",
                         surname: "Дегтярев",
                         avatar: UIImage(named: "ValeriiDegtyarev.png"),
                         images: [UIImage(named: "vd1"),
                                  UIImage(named: "vd2"),
                                  UIImage(named: "vd3"),
                                  UIImage(named: "vd4"),
                                  UIImage(named: "vd5"),
                                  UIImage(named: "vd6"),]),
                    User(name: "Ирина",
                         surname: "Дегтярева",
                         avatar: UIImage(named: "IrinaDegtyareva.png"),
                         images: [UIImage(named: "id1"),
                                  UIImage(named: "id2"),
                                  UIImage(named: "id3"),
                                  UIImage(named: "id4"),
                                  UIImage(named: "id5"),
                                  UIImage(named: "id6"),]),
                    User(name: " Антон",
                         surname: "Андреев",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Иван",
                         surname: "Иванов",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Константин",
                         surname: "Крутов",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Лариса",
                         surname: "Лю",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Марина",
                         surname: "Моисеева",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Николай",
                         surname: "Николаеевич",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Ольга",
                         surname: "Остина",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Петр",
                         surname: "Петров",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Роман",
                         surname: "Романов",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Стас",
                         surname: "Собачкин",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: " Татьяна",
                         surname: "Тимченко",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: "Ульяна",
                         surname: "Умная",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: "Федор",
                         surname: "Федоров",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: "Хаид",
                         surname: "Халили",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: "Шура",
                         surname: "Шурин",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                    User(name: "Юля",
                         surname: "Юнеева",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage")]),
                    User(name: "Янис",
                         surname: "Ятов",
                         avatar: UIImage(named: "naImage.png"),
                         images: [UIImage(named: "naImage"),]),
                 
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
