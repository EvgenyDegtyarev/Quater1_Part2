//
//  VKItems.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 31.05.2021.
//

import Foundation

struct VKItems <T:Codable>: Codable {
    let count: Int
    let items: [T]
}

