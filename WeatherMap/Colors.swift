//
//  Colors.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

extension UIColor {
    static var MountainMeadow: UIColor {
        return UIColor(r: 38, g: 196, b: 133, a: 1)
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
        
    }
}
