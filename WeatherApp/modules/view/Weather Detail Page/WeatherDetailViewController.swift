//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by neha on 14/06/19.
//  Copyright © 2019 neha. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    var ObjGetWeather : LiveWeatherNewsModel!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblCloud: UILabel!
     @IBOutlet weak var ImgWeather: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblTitle.text = ObjGetWeather.CityName
        lblDesc.text = ObjGetWeather.DescriptionValue
        lblTemp.text = String.init(format: "%d°C", ObjGetWeather.tempMain)
        lblWind.text = String.init(format: "%@ m/s", ObjGetWeather.speedWind)
         lblCloud.text = String.init(format: "%@%%", ObjGetWeather.allClouds)
         ImgWeather.sd_setImage(with: URL(string: String.init(format: "%@%@.png", Constants.IMGURL,ObjGetWeather.iconWeather)), placeholderImage: UIImage(named: ""))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.black
         self.navigationController?.navigationBar.isTranslucent = false

    }

   

}
