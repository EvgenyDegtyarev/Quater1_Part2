//
//  VKPhoto.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.06.2021.
//

import SwiftyJSON


struct VKPhoto: Codable {
    let photoID: Int
    let postID: Int
    let photoSize75: String
    let photoSize130: String
    let photoSize604: String
    let photoSize807: String?
    let photoSize1280: String?
    let photoSize2560: String?
}

extension VKPhoto {
    init(_ json: JSON) {
        let photoID = json["id"].intValue
        let postID = json["post_id"].intValue
        let photoSize75 = json["photo_75"].stringValue
        let photoSize130 = json["photo_130"].stringValue
        let photoSize604 = json["photo_604"].stringValue
        let photoSize807 = json["photo_807"].stringValue
        let photoSize1280 = json["photo_1280"].stringValue
        let photoSize2560 = json["photo_2560"].stringValue
        
        self.init(
            photoID: photoID,
            postID: postID,
            photoSize75: photoSize75,
            photoSize130: photoSize130,
            photoSize604: photoSize604,
            photoSize807: photoSize807,
            photoSize1280: photoSize1280,
            photoSize2560: photoSize2560
        )
    }
}
