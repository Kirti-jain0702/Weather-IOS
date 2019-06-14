//
//  LiveWeatherNewsRouter.swift
//  Live News
//
//  Created by MacBook Pro 13" on 2/4/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import UIKit

class LiveWeatherNewsRouter: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "WeatherNewsViewController") as? WeatherNewsViewController;
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
            let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = LiveWeatherNewsPresenter();
            let interactor: PresentorToInterectorProtocol = LiveWeatherNewsInterector();
            let router: PresenterToRouterProtocol = LiveWeatherNewsRouter();
            
            view?.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            presenter.interector = interactor;
            interactor.presenter = presenter;
        
        let navControll = UINavigationController.init(rootViewController: view!)
        
        return navControll;
            
        //}
        
        //return UIViewController()
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
