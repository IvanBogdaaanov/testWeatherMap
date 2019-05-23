//
//  ListViewController.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    let idCell = "idCell"
    let idCellDrop = "idCellDrop"
    var selectRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: idCell)
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
        
        switch selectRow {
        case nil:
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! ListTableViewCell
            return cell
        case selectRow where selectRow == indexPath.row:
            let cell = tableView.dequeueReusableCell(withIdentifier: idCellDrop, for: indexPath) as! DropdownTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! ListTableViewCell
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectRow {
            return 150
        } else {
            return 50
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectRow = indexPath.row
        
        tableView.beginUpdates()
        tableView.reloadData()
        tableView.endUpdates()

    }
    
}

