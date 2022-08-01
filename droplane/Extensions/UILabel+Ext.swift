//
//  UILabel+Ext.swift
//  droplane
//
//  Created by Vladimir Gusev on 30.07.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }

    convenience init(text: String?, font: UIFont, color: UIColor = .label) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = color
    }
}
