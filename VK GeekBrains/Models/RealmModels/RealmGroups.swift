//
//  RealmGroups.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 03.06.2021.
//

import Foundation
import RealmSwift

class GroupsRealm: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatarURL: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarURL = "photo_50"
    }
    
}
