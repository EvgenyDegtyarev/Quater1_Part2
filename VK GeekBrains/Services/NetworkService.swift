//
//  NetworkService.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 21.05.2021.
//

import UIKit
import Alamofire


//скопировано с вебинара, для проекта не используется
final class NetworkService {
    
    private let host = "https://api.openweathermap.org"
    
    static let session: Session = {
        let session = URLSessionConfiguration.default
        session.timeoutIntervalForRequest = 60
        let afSession = Session(configuration: session)
        
        return afSession
    }()
    

    func fetchWeather(for city: String) {
        let path = "/data/2.5/forecast"
        let parametrs: Parameters = [
            "q": city,
            "units": "metric",
            "appid": "f2bfc9ecbd40d4867ce6e7e6de10f5e0"
        ]
        
        AF.request(host + path,
                   method: .get,
                   parameters: parametrs)
            .responseJSON { json in
                print(json)
            }
    }
}
