//
//  VKPhoto.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.06.2021.
//

import SwiftyJSON

struct VKPhoto {
    let id: Int
    let albumID: Int
    let ownerID: Int
    let sizes: [VKPhotoSize]
}

extension VKPhoto {
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.albumID = json["album_id"].intValue
        self.ownerID = json["owner_id"].intValue
        let sizeJSONs = json["sizes"].arrayValue
        self.sizes = sizeJSONs.map { VKPhotoSize($0) }
    }
}
