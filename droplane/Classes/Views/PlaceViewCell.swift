//
//  PlaceViewCell.swift
//  droplane
//
//  Created by Vladimir Gusev on 09.07.2022.
//

import UIKit
import Then

final class PlaceViewCell: UICollectionViewCell {
    static let identifier = "CustomCell"

    let container = UIView().then {
        $0.layer.cornerRadius = 25
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    let imageView = UIImageView().then {
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
    }

    let label = UILabel().then {
        $0.textAlignment = .center
        $0.text = "Just for a test case #001"
        $0.font = .boldSystemFont(ofSize: 22)
    }

    let priceLabel = UILabel(text: "price", font: .boldSystemFont(ofSize: 12))

    override init(frame: CGRect) {
        super.init(frame: .zero)

        addSubview(container)

        addSubview(imageView)
        container.addSubview(label)
        container.addSubview(priceLabel)

        container.backgroundColor = .secondarySystemGroupedBackground

        label.sizeToFit()

        let blurEffect = UIBlurEffect(style: .regular)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        blurredEffectView.layer.cornerRadius = 25
        blurredEffectView.clipsToBounds = true
        insertSubview(blurredEffectView, belowSubview: imageView)
        
        container.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.bottom.equalToSuperview().offset(-26)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.top.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        blurredEffectView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.top.equalToSuperview()
            $0.height.equalTo(150)
        }

        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.bottom.equalToSuperview().offset(-30)
            $0.height.equalTo(25)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
