//
//  DropdownTableViewCell.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import SnapKit

class DropdownTableViewCell: UITableViewCell {
    
    let City = UILabel()
    let Temp = UILabel()
    let Pressure = UILabel()
    let Humidity = UILabel()
    let windSpeed = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
                
        contentView.addSubview(Temp)
        contentView.addSubview(Pressure)
        contentView.addSubview(windSpeed)
        contentView.addSubview(Humidity)
        contentView.addSubview(City)


        City.snp.makeConstraints { (maker) in
            maker.left.top.equalTo(10)
        }
        
        Temp.snp.makeConstraints { (makers) in
            makers.left.equalTo(10)
            makers.top.equalTo(City.snp.bottom).offset(20)
        }
        
        Pressure.snp.makeConstraints { (makers) in
            makers.left.equalTo(10)
            makers.top.equalTo(Temp.snp.bottom).offset(20)
        }
        
        Humidity.snp.makeConstraints { (makers) in
            makers.left.equalTo(10)
            makers.top.equalTo(Pressure.snp.bottom).offset(20)
        }
        
        windSpeed.snp.makeConstraints { (makers) in
            makers.left.equalTo(10)
            makers.top.equalTo(Humidity.snp.bottom).offset(20)
//            makers.bottom.equalTo(-10)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        City.text = ""
        Temp.text = ""
        Pressure.text = ""
        windSpeed.text = ""
        Humidity.text = ""
    }

    
    func setCity(_ list: List, details: Bool) {

        
        let newtemp = list.main.temp - 273.15
        let newwindSpeed = list.wind.speed * 3.6
        City.text = list.name
        
        if details {
            Temp.text = "Температура: \(Int(newtemp)) градусов"
            Pressure.text = "Давление: \(list.main.pressure)"
            Humidity.text = "Влажность: \(list.wind.speed)%"
            self.windSpeed.text = "Скорость ветра: \(Int(newwindSpeed)) км/ч"
        }
    }
}
