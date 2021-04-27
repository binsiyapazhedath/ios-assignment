//
//  Slider.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 27, 2021

import Foundation
import SwiftyJSON


class Slider : NSObject, NSCoding{

    var consultantId : Int!
    var courseId : Int!
    var descriptionField : String!
    var id : Int!
    var image : String!
    var imagePath : String!
    var title : String!
    var type : String!
    var url : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        consultantId = json["consultant_id"].intValue
        courseId = json["course_id"].intValue
        descriptionField = json["description"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        imagePath = json["image_path"].stringValue
        title = json["title"].stringValue
        type = json["type"].stringValue
        url = json["url"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if consultantId != nil{
        	dictionary["consultant_id"] = consultantId
        }
        if courseId != nil{
        	dictionary["course_id"] = courseId
        }
        if descriptionField != nil{
        	dictionary["description"] = descriptionField
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if image != nil{
        	dictionary["image"] = image
        }
        if imagePath != nil{
        	dictionary["image_path"] = imagePath
        }
        if title != nil{
        	dictionary["title"] = title
        }
        if type != nil{
        	dictionary["type"] = type
        }
        if url != nil{
        	dictionary["url"] = url
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		consultantId = aDecoder.decodeObject(forKey: "consultant_id") as? Int
		courseId = aDecoder.decodeObject(forKey: "course_id") as? Int
		descriptionField = aDecoder.decodeObject(forKey: "description") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		image = aDecoder.decodeObject(forKey: "image") as? String
		imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
		title = aDecoder.decodeObject(forKey: "title") as? String
		type = aDecoder.decodeObject(forKey: "type") as? String
		url = aDecoder.decodeObject(forKey: "url") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if consultantId != nil{
			aCoder.encode(consultantId, forKey: "consultant_id")
		}
		if courseId != nil{
			aCoder.encode(courseId, forKey: "course_id")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if imagePath != nil{
			aCoder.encode(imagePath, forKey: "image_path")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
