//
//  LiveNewsViewController.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class WeatherNewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var presenter: ViewToPresenterProtocol?
  
    
     @IBOutlet weak var TblWeatherList: UITableView!
        var ArrayFetchAllData = NSMutableArray()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let viewFooter = UIView()
        self.TblWeatherList.tableFooterView = viewFooter
        
        presenter?.updateView();
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    // MARK: - Tableview Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if ArrayFetchAllData.count > 0
        {
             return ArrayFetchAllData.count
        }
        else
        {
             return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell : LiveWeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LiveWeatherTableViewCell", for: indexPath) as! LiveWeatherTableViewCell
        
        cell.selectionStyle = .none
       
        let ObjWeather = ArrayFetchAllData.object(at: indexPath.row) as! LiveWeatherNewsModel
        
        cell.BindData(ObjWeatherData: ObjWeather)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
          let ObjWeather = ArrayFetchAllData.object(at: indexPath.row) as! LiveWeatherNewsModel
        vc.ObjGetWeather = ObjWeather
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension WeatherNewsViewController: PresenterToViewProtocol {

	func showNews(news: LiveWeatherNewsModel) {
        ArrayFetchAllData.add(news)
        TblWeatherList.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Weather", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
