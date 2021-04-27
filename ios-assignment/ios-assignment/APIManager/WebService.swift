//
//  WebService.swift
//  Matajar
//
//  Created by Rishad Appat on 24/04/2020.
//  Copyright © 2020 Aeth. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WebService {
    func get(url: String, params: Dictionary<String, Any>?, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        webService(url: url, method: .get, params: params, completion: completion, failed: failed)
    }
    
    func post(url: String, params: Dictionary<String, Any>?, completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(JSON(params!))
        }
        webService(url: url, method: .post, params: params, completion: completion, failed: failed)
    }
    
    func put(url: String, params: Dictionary<String, Any>?, completion:@escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        webService(url: url, method: .put, params: params, completion: completion, failed: failed)
    }
    
    private func webService(url: String, method: Alamofire.HTTPMethod, params: Dictionary<String, Any>?, completion: @escaping (JSON?) -> Void, failed: @escaping (String) -> Void)
    {
        print(url)
        if(params != nil)
        {
            print(params!)
        }
        if(Utility.isNetworkConnected()){
            var encoding: ParameterEncoding?
            if(method == .get)
            {
                encoding = URLEncoding.default
            }
            else
            {
                encoding = JSONEncoding.default
            }
            AF.request(url, method: method,
                          parameters: params,
                          encoding: encoding!,
                          headers: self.getHeaders(url: url))
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJSON(completionHandler: { (response) in
                    Utility.dismissProgress()
                    if let value = response.value as? [String: AnyObject] {
                        print(value)
                        if let status = value["status"] as? Int
                        {
                            if(status == 200)
                            {
                                completion(JSON(value))
                                return
                            }
                            else
                            {
                                failed("Please try again later")
                                return
                            }
                        }
                        failed("Please try again later")
                        return
                    }
                    else
                    {
                        failed("Please try again later")
                        return
                    }
            })
        }
        else{
            Utility.showErrorSnackView(message: "No network")
            return
        }
        
    }
    
    private func getHeaders(url urlString: String) -> HTTPHeaders{
        var headers: HTTPHeaders = HTTPHeaders()
        headers["Authorization"] = "Bearer \(Constants.token)"
        print(headers)
        return headers
    }
}
