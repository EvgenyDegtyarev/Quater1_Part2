//
//  AllGroupsTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let groups = [
    Group(name: "Работа", avatar: UIImage(named: "work.png")),
    Group(name: "Семья", avatar: UIImage(named: "family.png")),
    Group(name: "Спорт", avatar: UIImage(named: "sport.png")),
    Group(name: "История", avatar: UIImage(named: "history.png")),
    Group(name: "Будущее", avatar: UIImage(named: "future.png")),
    Group(name: "Хобби", avatar: UIImage(named: "hobbies.png")),
    Group(name: "Соседи", avatar: UIImage(named: "neighbours.png")),
    Group(name: "Авто", avatar: UIImage(named: "cars.png")),
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else {
            return UITableViewCell()
        }
        
        let currentGroup = groups[indexPath.row]
        cell.configure(image: currentGroup.avatar, name: currentGroup.name)
        return cell
    }
}
