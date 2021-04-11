//
//  User.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 11.04.2021.
//
import UIKit

struct User {
    let name: String
    let surname: String
    var fullname: String { "\(name) \(surname)" }
    let avatar: UIImage?
}
