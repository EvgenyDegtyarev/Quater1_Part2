//
//  NetworkService.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.05.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class NetworkService {
    
    let baseUrl = "https://api.vk.com/"
    let path = "method/"
    var id: String = ""
    var method: String = ""
    
    private let apiVersion = "5.130"
    
    private func makeComponents(for path: NetworkPaths) -> URLComponents {
        let urlComponent: URLComponents = {
            var url = URLComponents()
            url.scheme = "https"
            url.host = "api.vk.com"
            url.path = "/method/\(path.rawValue)"
            url.queryItems = [
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: apiVersion),
            ]
            return url
        }()
        
        return urlComponent
    }
    
    
    func getUserFriends() {
        var urlComponents = makeComponents(for: .getFriends)
        urlComponents.queryItems?.append(contentsOf: [
        URLQueryItem(name: "fields", value: "photo_200")
        ])
        
        if let url = urlComponents.url {
            AF.request(url).responseData { response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    let usersJSON = json["response"]["items"].arrayValue
                    usersJSON.map {VKUser($0)}
                    let vkUsers = usersJSON.map {VKUser($0)}
                    
                case .failure(let afError):
                    break
                }
                
            }
        }
    }
    
    func getFriends(_ user_id: String,_ order: String,_ offset: String,_ fields: String, completion: @escaping([VKUser]) -> Void) {
        
        let parameters: Parameters = [
            "access token" : Session.instance.token,
            "v" : "5.130",
            "user_id" : user_id,
            "order" : order,
            "offset" : offset,
            "fields" : fields
        ]
        
        let url = baseUrl+path+"friends.get"
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKUser>>.self) { response in
            switch response.result {
            case .success(let vkResponse):
                
                // 🚩Here
                completion(vkResponse.response.items)
                
            case .failure(_):
                print("error")
            }
        }
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
        
        //  makeRequest("groups.get", parameters)
        
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
        
//         makeRequest("groups.search", parameters)
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
        
        //  makeRequest("photos.get", parameters)
    }
}

