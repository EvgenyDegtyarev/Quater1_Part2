//
//  VKResponse.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 31.05.2021.
//

import Foundation

struct VKResponse <T:Codable>: Codable {
    let response: T
}
