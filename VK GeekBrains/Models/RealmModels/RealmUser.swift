//
//  RealmUser.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.06.2021.
//

import RealmSwift

class RealmUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var userAvatarURL: String = ""
}
