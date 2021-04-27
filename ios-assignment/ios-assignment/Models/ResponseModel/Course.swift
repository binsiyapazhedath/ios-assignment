//
//  Course.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 27, 2021

import Foundation
import SwiftyJSON


class Course : NSObject, NSCoding{

    var discountRate : String!
    var id : Int!
    var image : String!
    var imagePath : String!
    var name : String!
    var offerDeductedPrice : Int!
    var offerEnd : String!
    var offerStart : String!
    var offerprice : Int!
    var price : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        discountRate = json["discount_rate"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        imagePath = json["image_path"].stringValue
        name = json["name"].stringValue
        offerDeductedPrice = json["offer_deducted_price"].intValue
        offerEnd = json["offer_end"].stringValue
        offerStart = json["offer_start"].stringValue
        offerprice = json["offerprice"].intValue
        price = json["price"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if discountRate != nil{
        	dictionary["discount_rate"] = discountRate
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
        if name != nil{
        	dictionary["name"] = name
        }
        if offerDeductedPrice != nil{
        	dictionary["offer_deducted_price"] = offerDeductedPrice
        }
        if offerEnd != nil{
        	dictionary["offer_end"] = offerEnd
        }
        if offerStart != nil{
        	dictionary["offer_start"] = offerStart
        }
        if offerprice != nil{
        	dictionary["offerprice"] = offerprice
        }
        if price != nil{
        	dictionary["price"] = price
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		discountRate = aDecoder.decodeObject(forKey: "discount_rate") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		image = aDecoder.decodeObject(forKey: "image") as? String
		imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
		offerDeductedPrice = aDecoder.decodeObject(forKey: "offer_deducted_price") as? Int
		offerEnd = aDecoder.decodeObject(forKey: "offer_end") as? String
		offerStart = aDecoder.decodeObject(forKey: "offer_start") as? String
		offerprice = aDecoder.decodeObject(forKey: "offerprice") as? Int
		price = aDecoder.decodeObject(forKey: "price") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if discountRate != nil{
			aCoder.encode(discountRate, forKey: "discount_rate")
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
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if offerDeductedPrice != nil{
			aCoder.encode(offerDeductedPrice, forKey: "offer_deducted_price")
		}
		if offerEnd != nil{
			aCoder.encode(offerEnd, forKey: "offer_end")
		}
		if offerStart != nil{
			aCoder.encode(offerStart, forKey: "offer_start")
		}
		if offerprice != nil{
			aCoder.encode(offerprice, forKey: "offerprice")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}

	}

}
