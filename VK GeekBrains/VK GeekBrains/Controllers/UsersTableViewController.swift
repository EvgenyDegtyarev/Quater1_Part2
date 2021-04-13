//
//  UsersTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var friends = [User(name: "Евгений", surname: "Дегтярев", avatar: UIImage(named: "EvgenyDegtyarev")),
                    User(name: "Дарья", surname: "Дегтярева", avatar: UIImage(named: "DaryaDegtyareva") ),
                    User(name: "Дмитрий", surname: "Караваев", avatar: UIImage(named: "DmitriKaravaev")),
                    User(name: "Дарья", surname: "Караваева", avatar: UIImage(named: "DaryaKaravaeva")),
                    User(name: "Дмитрий", surname: "Калиниченко", avatar: UIImage(named: "DmitriKalinichenko")),
                    User(name: "Александра", surname: "Калиниченко", avatar: UIImage(named: "AlexandraKalinichenko")),
                    User(name: "Павел", surname: "Прокофьев", avatar: UIImage(named: "PavelProkofiev")),
                    User(name: "Тамара", surname: "Прокофьева", avatar: UIImage(named: "TomaProkofieva")),
                    User(name: "Алексей", surname: "Владимиров", avatar: UIImage(named: "AlexeyVladimirov")),
                         User(name: "Илона", surname: "Владимирова", avatar: UIImage(named: "IlonaVladimirova")),
                    User(name: "Валерий", surname: "Дегтярев", avatar: UIImage(named: "ValeriiDegtyarev.png")),
                    User(name: "Ирина", surname: "Дегтярева", avatar: UIImage(named: "IrinaDegtyareva.png")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

  
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
