//
//  PlaceDetailViewCell.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit

class PlaceDetailViewCell: UICollectionViewCell {
    lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 25
        $0.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(600)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
