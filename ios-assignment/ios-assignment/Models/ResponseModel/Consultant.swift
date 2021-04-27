//
//  Consultant.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 27, 2021

import Foundation
import SwiftyJSON


class Consultant : NSObject, NSCoding{

    var id : Int!
    var image : String!
    var imagePath : String!
    var name : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        id = json["id"].intValue
        image = json["image"].stringValue
        imagePath = json["image_path"].stringValue
        name = json["name"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if id != nil{
        	dictionary["id"] = id
        }
        if image != nil{
        	dictionary["image"] = image
        }
        if imagePath != nil{
        	dictionary["image_path"] = imagePath
        }
        if name != nil{
        	dictionary["name"] = name
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		id = aDecoder.decodeObject(forKey: "id") as? Int
		image = aDecoder.decodeObject(forKey: "image") as? String
		imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if imagePath != nil{
			aCoder.encode(imagePath, forKey: "image_path")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}
