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
        ListVC.title = "Cписок"
        ListVC.tabBarItem.image = ListImage
        
        setViewControllers([MapVC, ListVC], animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }
}
