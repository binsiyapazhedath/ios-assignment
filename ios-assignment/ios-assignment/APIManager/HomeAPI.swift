//
//  HomeAPI.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit

class HomeAPI: WebService {
    
    func getHome(completion:@escaping (HomeResponse) -> Void, failed: @escaping (String) -> Void){
        
        let url = BaseUrl.getBaseUrl() + EndPoints.Home.rawValue
        get(url: url, params: nil, completion: { (json) in
            let response = HomeResponse(fromJson: json)
            completion(response)
        }, failed: failed)
    }

}
