//
//  CustomCell.swift
//  droplane
//
//  Created by Vladimir Gusev on 09.07.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Just for a test case #001"
        view.font = .boldSystemFont(ofSize: 22)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(container)
        
        container.addSubview(imageView)
        container.addSubview(label)
        
        container.backgroundColor = .secondarySystemGroupedBackground
        
        label.sizeToFit()
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: container.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30),
            label.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
