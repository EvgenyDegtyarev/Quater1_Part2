//
//  NetworkService.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.05.2021.
//

import UIKit
import Alamofire

final class NetworkService {
    let baseUrl = "https://api.vk.com/"
    let path = "method/"
    var id: String = ""
    var method: String = ""
    
    func makeRequest (_ method: String,_ parameters: Parameters){
        let url = baseUrl + path + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in print(response.value ?? "Something went wrong")
        }
    }
    
    func getFriends(_ user_id: String,_ order: String,_ offset: String,_ fields: String){
        
        let parameters: Parameters = [
            "access token" : Session.instance.token,
            "v" : "5.130",
            "user_id" : user_id,
            "order" : order,
            "offset" : offset,
            "fields" : fields
        ]
        
        makeRequest("friends.get", parameters)
    }
    
}
