//
//  ListTableViewCell.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        title.text = "Город"
        
        addSubview(title)
        title.snp.makeConstraints { (makers) in
            makers.left.top.equalTo(10)
            makers.bottom.equalTo(-10)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

