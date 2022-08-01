//
//  SplashPresenter.swift
//  droplane
//
//  Created by Vladimir Gusev on 21.07.2022.
//

import UIKit

protocol SplashPresenterDescription {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

final class SplashPresenter: SplashPresenterDescription {
    func present() {

    }

    func dismiss(completion: @escaping () -> Void) {

    }
}
