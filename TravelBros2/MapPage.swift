//
//  MapPage.swift
//  TravelBros2
//
//  Created by Edvard Hedlund on 2018-09-26.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPage: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var address = ""
    var entryDate = ""
    
    @IBOutlet weak var entryMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var distance = 200.0
        
//        let route = UserDefaults.standard.integer(forKey: "route")
//        routeBtn.selectedSegmentIndex = route
//        let mapType = UserDefaults.standard.integer(forKey: "mapType")
//        mapTypeBtn.selectedSegmentIndex = mapType
//        swapMap(mapTypeBtn)
//
//        CLGeocoder().geocodeAddressString(address, completionHandler: {(placemarks, error) in
//            if let placemarks = placemarks {
//                let placemark = placemarks[0]
//                if let restLocation = placemark.location {
//
//                    distance = 2*self.myLocation.distance(from: restLocation)
//
//                    let region = MKCoordinateRegionMakeWithDistance(restLocation.coordinate, distance, distance)
//                    self.restMapView.setRegion(region, animated: false)
//
//                    let annotation = MKPointAnnotation()
//                    annotation.coordinate = restLocation.coordinate
//                    let distString = String(format: "%.1f", distance/1000)
//                    annotation.title = "\(self.restName)\n\(distString) km"
//                    self.restMapView.addAnnotation(annotation)
//
//                    self.restuarantLocation = restLocation
//                    //                    self.drawDirection()
//                    self.findMyLocation()
//                }
//            }
//        })
    }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.lineWidth = 3.0
            renderer.strokeColor = UIColor.purple
            renderer.alpha = 0.5
            return renderer
        }
        
        
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            let newLocation = locations[0]
//            print(newLocation)
//            let distance = myLocation.distance(from: newLocation)
//            if distance > 10 {
//                myLocation = newLocation
//                drawDirection()
//            }
//        }
        
//        override func viewWillDisappear(_ animated: Bool) {
//            UserDefaults.standard.set(routeBtn.selectedSegmentIndex, forKey: "route")
//            UserDefaults.standard.set(mapTypeBtn.selectedSegmentIndex, forKey: "mapType")
//        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
  
}
