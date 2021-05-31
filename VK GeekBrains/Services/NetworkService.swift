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
    func getGroups(_ user_id: String,_ extended: String,_ filter: String,_ fields: String,_ offset: String,_ count: String) {
             
            let parameters: Parameters = [
                "access_token" : Session.instance.token,
                "v" : "5.130",
                "user_id" : user_id,
                "extended" : extended,
                "filter" : filter,
                "fields" : fields,
                "offset" : offset,
                "count" : count
            ]
            
            makeRequest("groups.get", parameters)
        }
        
        func getSearchedGroups(_ searchText: String,_ type: String,_ country_id: String,_ city_id: String,_ future: String,_ market: String,_ sort: String,_ offset: String,_ count: String ) {
            
            let parameters: Parameters = [
                "access_token" : Session.instance.token,
                "v" : "5.130",
                "q" : searchText,
                "type" : type,
                "country_id" : country_id,
                "city_id" : city_id,
                "future" : future,
                "market" : market,
                "sort" : sort,
                "offset" : offset,
                "count" : count
            ]
            
            makeRequest("groups.search", parameters)
        }
        
        func getUserPhotos(_ owner_id: String,_ album_id: String,_ photo_ids: String,_ rev: String,_ extended: String,_ feed_type: String,_ feed: String,_ photo_sizes: String,_ offset: String,_ count: String) {
            
            let parameters: Parameters = [
                "access_token" : Session.instance.token,
                "v" : "5.130",
                "owner_id" : owner_id,
                "album_id" : album_id,
                "photo_ids" : photo_ids,
                "rev" : rev,
                "extended" : extended,
                "feed_type" : feed_type,
                "feed" : feed,
                "photo_sizes" : photo_sizes,
                "offset" : offset,
                "count" : count
            ]
            
            makeRequest("photos.get", parameters)
        }
        
    
}
