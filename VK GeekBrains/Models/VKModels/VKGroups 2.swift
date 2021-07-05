//
//  VKGroups.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.06.2021.
//

import SwiftyJSON

struct VKGroup {
    let id: Int
    let name: String
    let avatarURL: String
    let isMember: Bool
}

extension VKGroup {
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.avatarURL = json["photo_200"].stringValue
        self.isMember = json["is_member"].boolValue
    }
}
