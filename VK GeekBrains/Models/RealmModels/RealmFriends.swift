//
//  RealmFriends.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 03.06.2021.
//

import Foundation
import RealmSwift

class FriendsRealm: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var avatarURL: String = ""
    
    enum CodingCase: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarURL = "photo_100"
    }
}
