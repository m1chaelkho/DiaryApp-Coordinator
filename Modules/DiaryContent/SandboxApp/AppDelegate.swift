//
//  AppDelegate.swift
//  SandboxApp
//
//  Created by Michael Kho on 06/10/22.
//

import DiaryCoordinator
import DiaryContent
import DiaryFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let homeVC = HomeViewController()
        navigationController = UINavigationController(rootViewController: homeVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        setupGlobalCoordinator()

        return true
    }
}

// Setup Global Coordinator for DiaryContent Sandbox Here
extension AppDelegate {
    func setupGlobalCoordinator() {
        GlobalCoordinator.shared = GlobalCoordinator(
            router: { destination, navigationController in
                switch destination {
                case .content(let destination):
                    let navigator = DiaryContentNavigator(navigationController: navigationController)
                    navigator.navigate(destination)
                case .back:
                    navigationController.popViewController(animated: true)
                case .popToRootVC:
                    navigationController.popToRootViewController(animated: true)
                default:
                    break
                }
            },
            navigationController: navigationController)
    }
}
