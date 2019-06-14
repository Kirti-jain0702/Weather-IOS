//
//  LiveWeatherNewsInterector.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LiveWeatherNewsInterector: PresentorToInterectorProtocol{

    var presenter: InterectorToPresenterProtocol?;
    
    func fetchLiveNews() {
        
        
        var strurl = ""
        
        for index in 1...3
        {
           if index == 1
           {
                strurl = String.init(format: "%@New Jersey&appid=%@", Constants.URL,Constants.NEWS_API_KEY)
            }
            else if index == 2
           {
                 strurl = String.init(format: "%@london&appid=%@", Constants.URL,Constants.NEWS_API_KEY)
            }
            
            else
           {
                 strurl = String.init(format: "%@Tokyo&appid=%@", Constants.URL,Constants.NEWS_API_KEY)
            }
            
            strurl = strurl.replacingOccurrences(of: " ", with: "%20")
            
            
            AF.request(strurl).responseJSON { (response) in
                if(response.response?.statusCode == 200)
                {
                    print("URL = \(Constants.URL)")
                    //    print("response = \(response)")
                    print("response Value = \(response.result)")
                    
                    if let data = response.data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print("json = \(json as! NSDictionary)")
                            let JSON = json as! NSDictionary
                            
                            let obj = LiveWeatherNewsModel.init(JSON as! NSDictionary)
                            self.presenter?.liveNewsFetched(news: obj);
                            
                        } catch {
                            print("Error: ", error)
                        }
                        
                    }
                    
                    
                }
            }
        }
    }
}
