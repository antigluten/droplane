//
//  SectionView.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit
import SnapKit

class SectionView: UIView {

    private lazy var headerView = SectionHeaderView()
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .systemMint
        $0.layer.cornerRadius = 14
    }
    
    private lazy var contentView = UIView().then {
        $0.backgroundColor = .link
    }

}

extension SectionView {
    convenience init(title: String, iconName: String, contentView: UIView) {
        self.init(frame: .zero)
        setUpContent(contentView)
        headerView.setUp(title: title, iconName: iconName)
        configure()
    }
    
    convenience init(contentView: UIView) {
        self.init(frame: .zero)
        setUpContent(contentView)
        configureContainer()
    }
    
    private func configureHeader() {
        addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(4)
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.height.equalTo(80).priority(.low)
        }
    }
    
    private func configureContainer() {
        addSubviews(containerView)
        
        let constantValue = subviews.contains(headerView) ? 40 : 0
        
        snp.makeConstraints {
            $0.trailing.equalTo(containerView.snp.trailing)
            $0.bottom.equalTo(containerView.snp.bottom)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(constantValue)
            $0.leading.equalToSuperview()
        }
    }
    
    private func configure() {
        configureHeader()
        configureContainer()
    }
    
    private func setUpContent(_ view: UIView) {
        contentView = view
        
        containerView.addSubviews(contentView)
        
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().offset(-14)
        }
    }
}
