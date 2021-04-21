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
                        avatar: UIImage(named: "EvgenyDegtyarev")),
                    User(name: "Дарья",
                         surname: "Дегтярева",
                         avatar: UIImage(named: "DaryaDegtyareva") ),
                    User(name: "Дмитрий",
                         surname: "Караваев",
                         avatar: UIImage(named: "DmitriKaravaev")),
                    User(name: "Дарья",
                         surname: "Караваева",
                         avatar: UIImage(named: "DaryaKaravaeva")),
                    User(name: "Дмитрий",
                         surname: "Калиниченко",
                         avatar: UIImage(named: "DmitriKalinichenko")),
                    User(name: "Александра",
                         surname: "Калиниченко",
                         avatar: UIImage(named: "AlexandraKalinichenko")),
                    User(name: "Павел",
                         surname: "Прокофьев",
                         avatar: UIImage(named: "PavelProkofiev")),
                    User(name: "Тамара",
                         surname: "Прокофьева",
                         avatar: UIImage(named: "TomaProkofieva")),
                    User(name: "Алексей",
                         surname: "Владимиров",
                         avatar: UIImage(named: "AlexeyVladimirov")),
                         User(name: "Илона",
                              surname: "Владимирова",
                              avatar: UIImage(named: "IlonaVladimirova")),
                    User(name: "Валерий",
                         surname: "Дегтярев",
                         avatar: UIImage(named: "ValeriiDegtyarev.png")),
                    User(name: "Ирина",
                         surname: "Дегтярева",
                         avatar: UIImage(named: "IrinaDegtyareva.png")),
                    User(name: " Антон",
                         surname: "Андреев",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Борис",
                         surname: "Борисов",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Валентин",
                         surname: "Владимиров",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Георгий",
                         surname: "Гореев",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Евгений",
                         surname: "Евстегнеев",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Жота",
                         surname: "Жиев",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Заур",
                         surname: "Зуев",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Иван",
                         surname: "Иванов",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Константин",
                         surname: "Крутов",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Лариса",
                         surname: "Лю",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Марина",
                         surname: "Моисеева",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Николай",
                         surname: "Николаеевич",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Ольга",
                         surname: "Остина",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Петр",
                         surname: "Петров",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Роман",
                         surname: "Романов",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Стас",
                         surname: "Собачкин",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: " Татьяна",
                         surname: "Тимченко",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Ульяна",
                         surname: "Умная",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Федор",
                         surname: "Федоров",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Хаид",
                         surname: "Халили",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Шура",
                         surname: "Шурин",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Юля",
                         surname: "Юнеева",
                         avatar: UIImage(named: "naImage.png")),
                    User(name: "Янис",
                         surname: "Ятов",
                         avatar: UIImage(named: "naImage.png")),
    ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "FriendCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FriendCell")
        
        
        friends.sort(by:
                        { $0.surname < $1.surname }
            )
        var surnames: [String] = []
        friends.forEach {
        surnames.append($0.surname)
        }
        let firstLetters = surnames.map{
            String($0.first!)
        }
        var lettersForHeaders = Array(Set(firstLetters))
        lettersForHeaders.sort(by: { $0 < $1 })
        

        var dictionary: [Character: [User]] = [:]

        for (index, element) in lettersForHeaders.enumerated() {
            dictionary[element] = User[index]
        }
        
    }

  

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell()}
        let currentFriend = friends[indexPath.row]

        cell.configure(image: currentFriend.avatar, name: currentFriend.fullname)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showUserPhotos",
            let destination = segue.destination as? FriendsPhotoCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        destination.userImages = [friends[index].avatar]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

 
}
