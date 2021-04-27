//
//  Datum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 27, 2021

import Foundation
import SwiftyJSON


class HomeResponseData : NSObject, NSCoding{

    var categories : [Category]!
    var consultants : [Consultant]!
    var courses : [Course]!
    var messageTypes : [MessageType]!
    var notificationCount : Int!
    var slider : [Slider]!
    var subscriptions : [AnyObject]!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        categories = [Category]()
        let categoriesArray = json["categories"].arrayValue
        for categoriesJson in categoriesArray{
            let value = Category(fromJson: categoriesJson)
            categories.append(value)
        }
        consultants = [Consultant]()
        let consultantsArray = json["consultants"].arrayValue
        for consultantsJson in consultantsArray{
            let value = Consultant(fromJson: consultantsJson)
            consultants.append(value)
        }
        courses = [Course]()
        let coursesArray = json["courses"].arrayValue
        for coursesJson in coursesArray{
            let value = Course(fromJson: coursesJson)
            courses.append(value)
        }
        messageTypes = [MessageType]()
        let messageTypesArray = json["message_types"].arrayValue
        for messageTypesJson in messageTypesArray{
            let value = MessageType(fromJson: messageTypesJson)
            messageTypes.append(value)
        }
        notificationCount = json["notification_count"].intValue
        slider = [Slider]()
        let sliderArray = json["slider"].arrayValue
        for sliderJson in sliderArray{
            let value = Slider(fromJson: sliderJson)
            slider.append(value)
        }
        subscriptions = [AnyObject]()
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if categories != nil{
        var dictionaryElements = [[String:Any]]()
        for categoriesElement in categories {
        	dictionaryElements.append(categoriesElement.toDictionary())
        }
        dictionary["categories"] = dictionaryElements
        }
        if consultants != nil{
        var dictionaryElements = [[String:Any]]()
        for consultantsElement in consultants {
        	dictionaryElements.append(consultantsElement.toDictionary())
        }
        dictionary["consultants"] = dictionaryElements
        }
        if courses != nil{
        var dictionaryElements = [[String:Any]]()
        for coursesElement in courses {
        	dictionaryElements.append(coursesElement.toDictionary())
        }
        dictionary["courses"] = dictionaryElements
        }
        if messageTypes != nil{
        var dictionaryElements = [[String:Any]]()
        for messageTypesElement in messageTypes {
        	dictionaryElements.append(messageTypesElement.toDictionary())
        }
        dictionary["messageTypes"] = dictionaryElements
        }
        if notificationCount != nil{
        	dictionary["notification_count"] = notificationCount
        }
        if slider != nil{
        var dictionaryElements = [[String:Any]]()
        for sliderElement in slider {
        	dictionaryElements.append(sliderElement.toDictionary())
        }
        dictionary["slider"] = dictionaryElements
        }
        if subscriptions != nil{
        	dictionary["subscriptions"] = subscriptions
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		categories = aDecoder.decodeObject(forKey: "categories") as? [Category]
		consultants = aDecoder.decodeObject(forKey: "consultants") as? [Consultant]
		courses = aDecoder.decodeObject(forKey: "courses") as? [Course]
		messageTypes = aDecoder.decodeObject(forKey: "message_types") as? [MessageType]
		notificationCount = aDecoder.decodeObject(forKey: "notification_count") as? Int
		slider = aDecoder.decodeObject(forKey: "slider") as? [Slider]
		subscriptions = aDecoder.decodeObject(forKey: "subscriptions") as? [AnyObject]
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if categories != nil{
			aCoder.encode(categories, forKey: "categories")
		}
		if consultants != nil{
			aCoder.encode(consultants, forKey: "consultants")
		}
		if courses != nil{
			aCoder.encode(courses, forKey: "courses")
		}
		if messageTypes != nil{
			aCoder.encode(messageTypes, forKey: "message_types")
		}
		if notificationCount != nil{
			aCoder.encode(notificationCount, forKey: "notification_count")
		}
		if slider != nil{
			aCoder.encode(slider, forKey: "slider")
		}
		if subscriptions != nil{
			aCoder.encode(subscriptions, forKey: "subscriptions")
		}

	}

}
