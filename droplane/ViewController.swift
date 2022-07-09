//
//  ViewController.swift
//  droplane
//
//  Created by Vladimir Gusev on 19.05.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let horizontalController = MainHorizontalController()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        map.mapType = .standard
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    let initalCoordinates = CLLocationCoordinate2D(latitude: 59.9357, longitude: 30.3258)
    let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        let region = MKCoordinateRegion(center: initalCoordinates, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        
        view.addSubview(mapView)
        view.addSubview(horizontalController.view)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            horizontalController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalController.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

