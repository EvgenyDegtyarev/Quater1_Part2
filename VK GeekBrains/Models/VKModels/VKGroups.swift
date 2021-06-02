//
//  VKGroups.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.06.2021.
//

import SwiftyJSON

struct VKGroups: Codable {
    let groupID: Int
    let groupName: String
    let groupAvatar: String
}

extension VKGroups {
    init(_ json: JSON) {
        let groupID = json["id"].intValue
        let groupName = json["name"].stringValue
        let groupAvatar = json["photo_200"].stringValue
        
        self.init(
            groupID: groupID,
            groupName: groupName,
            groupAvatar: groupAvatar
        )
    }
}
