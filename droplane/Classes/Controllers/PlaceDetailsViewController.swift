//
//  PlaceDetailsViewController.swift
//  droplane
//
//  Created by Vladimir Gusev on 30.07.2022.
//

import UIKit
import SnapKit

final class PlaceDetailsViewController: UICollectionViewController {
    let place: Place
    
    init(place: Place) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
