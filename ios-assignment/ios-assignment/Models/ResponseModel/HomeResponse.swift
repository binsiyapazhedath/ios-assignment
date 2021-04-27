//
//  HomeResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 27, 2021

import Foundation
import SwiftyJSON


class HomeResponse : NSObject, NSCoding{

    var data : HomeResponseData!
    var status : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        let dataJson = json["data"]
        if !dataJson.isEmpty{
            data = HomeResponseData(fromJson: dataJson)
        }
        status = json["status"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if data != nil{
        	dictionary["data"] = data.toDictionary()
        }
        if status != nil{
        	dictionary["status"] = status
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		data = aDecoder.decodeObject(forKey: "data") as? HomeResponseData
		status = aDecoder.decodeObject(forKey: "status") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
