//
//  MapView.swift
//  WeatherMap
//
//  Created by Иван on 22.05.2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class MapView: GMSMapView {


    override init(frame: CGRect) {
        super.init(frame: frame)
            delegate = self
            }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sizeMap(VC:UIViewController) {

        VC.view.addSubview(self)
        self.snp.makeConstraints { (makers) in
            makers.left.right.bottom.top.equalToSuperview()
        }
    }

}
extension MapView: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.clear()
        let markerOnMap = GMSMarker()
        markerOnMap.position = coordinate
        markerOnMap.map = self
        
//        let url = URL(string: <#T##String#>)
    }
}
