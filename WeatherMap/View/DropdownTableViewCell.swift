//
//  DropdownTableViewCell.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class DropdownTableViewCell: UITableViewCell {

    let title = UILabel()
    let WeatherLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        title.text = "Город"
        WeatherLabel.text = "Погода на завтра"
        
        addSubview(WeatherLabel)
        addSubview(title)
        title.snp.makeConstraints { (makers) in
            makers.left.top.equalTo(25)
        }
        WeatherLabel.snp.makeConstraints { (makers) in
            makers.left.equalTo(25)
            makers.top.equalTo(title.snp_bottomMargin).offset(20)
        }
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
