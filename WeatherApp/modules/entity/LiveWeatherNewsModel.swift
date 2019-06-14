//
//  LiveWeatherNewsModel.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
//import ObjectMapper



class LiveWeatherNewsModel: NSObject{
    
    var iconWeather      : String = ""
    var tempMain         : Int = 0
    var speedWind         : String = ""
    var allClouds     : String = ""
    var DescriptionValue    : String = ""
    var CityName      : String = ""
    
      var json            : NSDictionary = NSDictionary()
    
    override init() {
        
    }
    
    
    
    convenience init(_ json: NSDictionary){
        self.init()
        self.initWithJSON(json: json)
        
    }
    
    func initWithJSON(json:NSDictionary) {
        self.json = json
        
        
        if let valCity = json["name"]
        {
            if valCity is String
            {
                CityName = valCity as! String
            }
        }
        
        if let val = json["weather"]
        {
          let  WeatherArray = (val as? NSArray) ?? NSArray()
            
            if WeatherArray.count > 0
            {
                let dictWeather = WeatherArray.object(at: 0) as! NSDictionary
                
                if let valWeatherIcon = dictWeather["icon"]
                {
                    if valWeatherIcon is String
                    {
                        iconWeather = valWeatherIcon as! String
                    }
                }
                if let valWeatherDesc = dictWeather["description"]
                {
                    if valWeatherDesc is String
                    {
                        DescriptionValue = valWeatherDesc as! String
                    }
                }
            }
        }
        
        
        if let val = json["wind"]{
           let windDict = (val as? NSDictionary) ?? NSDictionary()
            
            if let valWindSpped = windDict["speed"]
            {
                if valWindSpped is NSNumber
                {
                     let speedWindVla = valWindSpped as! NSNumber
                    speedWind = speedWindVla.stringValue
                }
            }
            
        }
        
        if let val = json["clouds"]{
           let CloudDict = (val as? NSDictionary) ?? NSDictionary()
            
            if let valCloud = CloudDict["all"]
            {
                if valCloud is NSNumber
                {
                     let allCloudsVla = valCloud as! NSNumber
                    allClouds = allCloudsVla.stringValue
                }
            }
        }
        
        if let val = json["main"]{
           let TempMainDict = (val as? NSDictionary) ?? NSDictionary()
            
            if let valTemp = TempMainDict["temp"]
            {
                if valTemp is NSNumber
                {
                    let tempMainVla = valTemp as! NSNumber
                    
                    //tempMain = Int(5.0 / 9.0 * (Double(tempMainVla.intValue) - 32.0))
                    
                    tempMain = Int(ConvertKelvinTempToCelsius(Temp: tempMainVla))!
                    
                }
                
            }
        }
        
       
        
    }
   
    
    
   
    func ConvertKelvinTempToCelsius(Temp : NSNumber) -> String
    {
        let celsiusTemp = Temp.doubleValue - 273.15
        return String(format: "%.0f", celsiusTemp)
    }
    
    
}
