//
//  MySingleton.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 19.05.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    private init() { }
    
    var userId: Int?
    var token: String = ""
    var myID: String = ""
    var appID: Int = 7859978
    var accessKey = "dbnVS1GGixy5o3F7CMUg"
}
