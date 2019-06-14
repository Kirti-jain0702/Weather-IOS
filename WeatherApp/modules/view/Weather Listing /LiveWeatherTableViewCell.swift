//
//  LiveWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by neha on 13/06/19.
//  Copyright © 2019 neha. All rights reserved.
//

import UIKit

class LiveWeatherTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
     @IBOutlet var descLabel: UILabel!
    @IBOutlet var imgIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
     // MARK: - Fetch All Data
    func BindData(ObjWeatherData : LiveWeatherNewsModel)
    {
        
        imgIcon.sd_setImage(with: URL(string: String.init(format: "%@%@.png", Constants.IMGURL,ObjWeatherData.iconWeather)), placeholderImage: UIImage(named: ""))
        descLabel.text = ObjWeatherData.DescriptionValue
        descriptionLabel.text = String.init(format: "%d°C", ObjWeatherData.tempMain)
        titleLabel.text = ObjWeatherData.CityName
    }
    

}
