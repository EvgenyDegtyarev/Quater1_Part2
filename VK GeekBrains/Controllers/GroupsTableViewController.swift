//
//  GroupsTableViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//

import UIKit


class GroupsTableViewController: UITableViewController {
    
    let networkService = NetworkService()
    var groups = [VKGroup]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
   /*     guard
            segue.identifier == "addGroup",
        let allGroupsController = segue.source as? AllGroupsTableViewController,
            let indexPath = allGroupsController.tableView.indexPathForSelectedRow
        else { return }
        let group = allGroupsController.groups[indexPath.row]
        if !groups.contains(group) {
            groups.append(group)
            tableView.reloadData()
        }
 */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserGroups { [weak self] vkGroups in
            guard
                let self = self,
                let groups = vkGroups
            else {return}
            self.groups = groups
        }
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else {
            return UITableViewCell()
        }
        
        let currentGroup = groups[indexPath.row]
        cell.configure(imageURL: currentGroup.avatarURL, name: currentGroup.name)
        return cell
    }
    
   // override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    tableView.deselectRow(at: IndexPath, animated: true)
   // }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
