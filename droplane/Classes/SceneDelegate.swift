//
//  SceneDelegate.swift
//  droplane
//
//  Created by Vladimir Gusev on 19.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let appDependencies = AppDependencies()

    private var splashPresenter: SplashPresenterDescription? = SplashPresenter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        appDependencies.installRootViewControllerIntoWindow(window)
//
//        splashPresenter?.present()
//
//        let delay: TimeInterval = 2
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            self.splashPresenter?.dismiss { [weak self] in
//                self?.splashPresenter = nil
//            }
//        }
//        window.rootViewController = ViewController()
//
    }
}
