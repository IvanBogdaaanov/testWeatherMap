//
//  TabBarViewController.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    let MapVC = MapViewController()
    let ListVC = ListViewController()
    
    let ListImage = UIImage(named: "list")?.withRenderingMode(.alwaysOriginal)
    let MapImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapVC.tabBarItem.image = MapImage
        MapVC.title = "Карта"
        MapVC.tabBarItem.tag = 0
        ListVC.title = "Cписок"
        ListVC.tabBarItem.image = ListImage
        ListVC.tabBarItem.tag = 1
        
        setViewControllers([MapVC, ListVC], animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            guard let data = MapVC.dataForTable else {return}
            ListVC.dataWeather = data
            
        default: break
        }
    }
}

