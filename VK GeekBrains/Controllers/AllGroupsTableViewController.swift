//
//  AllGroupsTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit


class AllGroupsTableViewController: UITableViewController {
    
    private let networkService = NetworkService()
    var groups = [VKGroup]() {
        didSet {
            tableView.reloadData()
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserGroups { [weak self] vkGroups in
            guard
                let self = self,
                let groups = vkGroups
            else { return }
            self.groups = groups
        }
        
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
        cell.configure(imageURL: currentGroup.avatarURL, name: currentGroup.name)
        return cell
    }
}
