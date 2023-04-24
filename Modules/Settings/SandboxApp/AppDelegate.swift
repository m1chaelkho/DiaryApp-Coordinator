//
//  AppDelegate.swift
//  SandboxApp
//
//  Created by Michael Kho on 06/10/22.
//

import DiaryCoordinator
import Settings

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        setupGlobalCoordinator()
        GlobalCoordinator.shared.navigate(.settings(.setting(profileId: "some-profile-id")))
        
        return true
    }
}

// Setup Global Coordinator for Authentication Sandbox Here
extension AppDelegate {
    func setupGlobalCoordinator() {
        GlobalCoordinator.shared = GlobalCoordinator(
            router: { destination, navigationController in
                switch destination {
                case .settings(let settingsDestination):
                    let navigator = SettingsNavigator(navigationController: navigationController)
                    navigator.navigate(settingsDestination)
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

