//
//  SectionHeaderView.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit

class SectionHeaderView: UIView {

    private lazy var backgroundStackView = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private lazy var iconImageView = UIImageView().then {
        $0.preferredSymbolConfiguration = .init(
            font: .preferredFont(forTextStyle: .subheadline),
            scale: .small
        )
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .link
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        addSubviews(backgroundStackView)
        backgroundStackView.addArrangedSubview(iconImageView)
        backgroundStackView.addArrangedSubview(titleLabel)
        backgroundColor = .clear
        layer.cornerRadius = 14
        
        backgroundStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().offset(-24)
        }
        
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
    }
}

extension SectionHeaderView {
    func setUp(title: String, iconName: String) {
        titleLabel.text = title.uppercased()
        iconImageView.image = UIImage(systemName: iconName)
    }
}
