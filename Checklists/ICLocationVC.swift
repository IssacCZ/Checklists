//
//  ICLocationVC.swift
//  Checklists
//
//  Created by IssacCZ on 11/6/15.
//  Copyright © 2015 Issac. All rights reserved.
//

import UIKit
import CoreLocation

class ICLocationVC: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    var newLocation: CLLocation!
    var coordinate: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        if (Float(UIDevice.currentDevice().systemVersion) >= 8.0) {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if (!CLLocationManager.locationServicesEnabled()) {
            print("请开启定位:设置 > 隐私 > 位置 > 定位服务");
        }
        
        if (locationManager.respondsToSelector(Selector("requestAlwaysAuthorization"))) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        newLocation = locations.last!
        let lat = newLocation.coordinate.latitude
        let lon = newLocation.coordinate.longitude
        print(lat, lon)
        locationLabel.text = String(lat)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
}
