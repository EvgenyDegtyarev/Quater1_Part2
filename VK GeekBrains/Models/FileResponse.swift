//
//  FileResponse.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 31.05.2021.
//

import Foundation

struct FileResponse: Decodable {
  var count: Int
  var name: String
  var surname: String
  var id: Int
  var photo: String
}

extension FileResponse {
  enum CodingKeys: String, CodingKey {
      case response
  }
  enum Responce: String, CodingKey {
      case count = "count"
      case items
  }
  enum Items: String, CodingKey {
      case name = "first_name"
      case surname = "last_name"
      case id = "id"
      case photo = "photo_200_orig"
  }
  
  init(from decoder: Decoder) throws {
      try! self.init(from: decoder)
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let responce = try container.nestedContainer(keyedBy: Responce.self, forKey: .response)
      self.count = try responce.decode(Int.self, forKey: .count)
      let items = try responce.nestedContainer(keyedBy: Items.self, forKey: .items)
      self.name = try items.decode(String.self, forKey: .name)
      self.surname = try items.decode(String.self, forKey: .surname)
      self.id = try items.decode(Int.self, forKey: .id)
      self.photo = try items.decode(String.self, forKey: .photo)
  }
  
}
