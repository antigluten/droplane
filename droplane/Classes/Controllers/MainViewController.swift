//
//  MainViewController.swift
//  droplane
//
//  Created by Vladimir Gusev on 19.05.2022.
//

import UIKit
import MapKit
import CoreLocation
import Then
import SnapKit

final class MainViewController: UIViewController {

    private lazy var profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }

    private lazy var horizontalController = MainHorizontalController()

    private lazy var mapView = MKMapView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        setupMap()
        layoutMap()
        layoutHorizontalController()
        detectMapChanged()
    }
}

private extension MainViewController {
    func setup() {
        view.backgroundColor = .white
    }
    
    // TODO: change data
    func setupMap() {
        let initalCoordinates = CLLocationCoordinate2D(latitude: 59.9357, longitude: 30.3258)
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)

        let region = MKCoordinateRegion(center: initalCoordinates, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
    }

    func layoutMap() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func layoutHorizontalController() {
        add(horizontalController)
        
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
}

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension MainViewController: MKMapViewDelegate {

}
