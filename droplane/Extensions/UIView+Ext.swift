//
//  UIView+Ext.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
