//
//  ViewController.swift
//  maps_Zgorodny_Zyablov
//
//  Created by Даниил on 20.12.2021.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController, CLLocationManagerDelegate {
    let LocationManager = CLLocationManager()
    @IBOutlet weak var dataLat: UILabel!
    @IBOutlet weak var dataLon: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
    }
func checkAuthorization(){
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse:
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.startUpdatingLocation()
        print("Error")
    case .notDetermined:
        LocationManager.requestWhenInUseAuthorization()
        default:
            break
}
}
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last?.coordinate {
            dataLat.text = String(location.latitude)
            dataLon.text = String(location.longitude)
            LocationManager.stopUpdatingLocation()
        }
        
    }
    
}
