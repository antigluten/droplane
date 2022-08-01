//
//  SplashAnimator.swift
//  droplane
//
//  Created by Vladimir Gusev on 21.07.2022.
//

import UIKit

protocol SplashAnimatorDescription {
    func animateAppearance()
    func animateDisappearance(completion: @escaping () -> Void)
}

final class SplashAnimator: SplashAnimatorDescription {
    func animateAppearance() {

    }

    func animateDisappearance(completion: @escaping () -> Void) {

    }
}
