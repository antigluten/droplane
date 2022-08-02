//
//  SearchViewController.swift
//  droplane
//
//  Created by Vladimir Gusev on 19.05.2022.
//

import UIKit
import MapKit
import CoreLocation
import Then
import SnapKit

final class SearchViewController: UIViewController {
    
    weak var coordinator: SearchCoordinator?
    
    var locationManager: CLLocationManager?
    var previousLocation: CLLocation?

    private lazy var profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }

    private lazy var horizontalController = PlaceCarouselHorizontalController()

    private lazy var mapView = MKMapView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        setupLocationManager()
        checkLocationAutorization()
        
        setupMap()
        layoutMap()
        layoutHorizontalController()
        detectMapChanged()
        
        addPin()
    }
}

private extension SearchViewController {
    func setup() {
        view.backgroundColor = .white
        horizontalController.coordinator = coordinator
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
    }
    
    func checkLocationAutorization() {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            activateLocationServices()
        } else {
            locationManager?.requestWhenInUseAuthorization()
        }
        
    }
    
    // TODO: change data
    func setupMap() {
        let initalCoordinates = CLLocationCoordinate2D(latitude: 59.9357, longitude: 30.3258)
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)

        let region = MKCoordinateRegion(center: initalCoordinates, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        
        
//        mapView.showsUserLocation = true
    }

    func layoutMap() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func layoutHorizontalController() {
        add(horizontalController)
        horizontalController.view.isHidden = true
        
        horizontalController.view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.equalTo(250)
        }
    }

    func detectMapChanged() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(hide))
        panGestureRecognizer.delegate = self
        mapView.addGestureRecognizer(panGestureRecognizer)
    }

    @objc func hide(gestureRecognizer: UIGestureRecognizer) {
        // TODO: ANIMATE HIDING THE CONTROLLER
        if gestureRecognizer.state == .ended {
            UIView.animate(withDuration: 0.5) {
                self.horizontalController.view.transform = .identity
                self.view.layoutIfNeeded()
            }
        } else if gestureRecognizer.state == .began {
            UIView.animate(withDuration: 0.5) {
                self.horizontalController.view.transform = .init(translationX: 0.0, y: 400)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    private func addPin() {
        let pin = MKPointAnnotation()
        pin.title = "title"
        pin.subtitle = "subtitle"
        
        // TODO: Make it interactive to the user touches
        pin.coordinate = CLLocationCoordinate2D(latitude: 59.9357, longitude: 30.3258)
        mapView.addAnnotation(pin)
    }
}

extension SearchViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension SearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
            annotationView?.canShowCallout = true
            
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(systemName: "mappin.circle.fill")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        UIView.animate(withDuration: 1) {
            self.horizontalController.view.isHidden = false
            self.view.layoutIfNeeded()
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        UIView.animate(withDuration: 1) {
            self.horizontalController.view.isHidden = true
            self.view.layoutIfNeeded()
        }
    }
}

extension SearchViewController: CLLocationManagerDelegate {
    
    func activateLocationServices() {
        locationManager?.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            print("ios 13")
            activateLocationServices()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14, *) {
            let status = manager.authorizationStatus
            if status == .authorizedWhenInUse || status == .authorizedWhenInUse {
                print("ios 14")
                activateLocationServices()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if previousLocation == nil {
            previousLocation = locations.first
        } else {
            guard let latest = locations.first else { return }
            print(latest.coordinate)
            previousLocation = latest
        }
    }
}
