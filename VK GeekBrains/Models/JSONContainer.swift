//
//  JSONContainer.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 31.05.2021.
//

import Foundation

struct JSONContainer: Codable {
    let count: Int
    let vkFriends: [VKFriends]
}
