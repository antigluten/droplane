//
//  PlaceDetailHeaderView.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit

class PlaceDetailHeaderView: UICollectionReusableView {
    
    lazy var imageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
