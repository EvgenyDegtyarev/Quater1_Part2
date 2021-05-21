//
//  MySingleton.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 19.05.2021.
//

import Foundation

class MySingleton {
    
    static let instance = MySingleton()
    private init() { }
    
    var userId: Int?
    var token: String = ""
}