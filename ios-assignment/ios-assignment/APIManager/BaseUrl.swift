//
//  Url.swift
//  Matajar
//
//  Created by Rishad Appat on 24/04/2020.
//  Copyright © 2020 Aeth. All rights reserved.
//

import UIKit

class BaseUrl {
    
    private static let testBaseUrl = "https://super-servers.com/estisharati/api/v1/en/"
    
    class func getBaseUrl() -> String
    {
        return testBaseUrl
       
    }
}
