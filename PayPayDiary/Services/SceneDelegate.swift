//
//  SceneDelegate.swift
//  PayPayDiary
//
//  Created by Michael Kho on 2023/03/10.
//

import Authentication
import DiaryContent
import DiaryCoordinator
import Settings
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()

        setupGlobalCoordinator()
        GlobalCoordinator.shared.navigate(.auth(.login(someVariable: "test")))
    }
}

extension SceneDelegate {
    private func setupGlobalCoordinator() {
        GlobalCoordinator.shared = GlobalCoordinator(
            router: { (destination, navigationController) in
                let navigator = MainNavigator(navigationController: navigationController)
                navigator.navigate(destination)
            },
            navigationController: navigationController)
    }
}
