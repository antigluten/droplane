//
//  AppDelegate.swift
//  droplane
//
//  Created by Vladimir Gusev on 19.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        return true
    }
    
    private func setupAppearance() {
        let apperance = UITabBar.appearance()
        apperance.backgroundColor = .tertiarySystemBackground
    }
}
