//
//  ListViewController.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var dataWeather: Weather?
    let idCell = "idCell"
    let idCellDrop = "idCellDrop"
    var selectRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(DropdownTableViewCell.self, forCellReuseIdentifier: idCellDrop)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectRow = nil
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCellDrop, for: indexPath) as! DropdownTableViewCell
        
        if let dataWeather = dataWeather {
            let list = dataWeather.list[indexPath.row]
            cell.setCity(list, details: selectRow == indexPath.row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWeather != nil ? 20 : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == selectRow ? 200 : 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRow = indexPath.row
        tableView.reloadData()
    }
}

