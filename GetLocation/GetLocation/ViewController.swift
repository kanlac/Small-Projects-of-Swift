//
//  ViewController.swift
//  GetLocation
//
//  Created by serfusE on 15/10/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var getLocationButton: UIButton!

    let manager = CLLocationManager()
    
    @IBAction func requestLocation(_ sender: Any) {
        manager.startUpdatingLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        manager.stopUpdatingLocation()
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemark, error) -> Void in
            if (error != nil) {
                print("Reverse Geocode Location Error!")
            } else {
                if let pm = placemark?[0] {
                    self.displayLocationFromPlacemark(placemark: pm)
                }
                
            }
        })
        
    }
    
    func displayLocationFromPlacemark(placemark: CLPlacemark) {
        if let locality: String = placemark.locality {
            locationLabel.text? = locality
        } else {
            print("Convert to Locality Error!")
        }
        
    }

}

