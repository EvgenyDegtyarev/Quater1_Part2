//
//  VKUser.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 31.05.2021.
//

import SwiftyJSON

struct VKUser {
    let id: Int
    let firstName: String
    let lastName: String
    let avatarURL: String
    
    var fullName: String { "\(firstName) + \(lastName)" }
}

extension VKUser {
    init(_ json: JSON) {
        let id = json["id"].intValue
        let firstName = json["first_name"].stringValue
        let lastName = json["last_name"].stringValue
        let avatarURL = json["photo_200"].stringValue
        
        self.init(
            id: id,
            firstName: firstName,
            lastName: lastName,
            avatarURL: avatarURL
        )
    }
}
