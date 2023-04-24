//
//  AppDelegate.swift
//  SandboxApp
//
//  Created by Michael Kho on 06/10/22.
//

import Authentication
import DiaryCoordinator
import DiaryFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        setupGlobalCoordinator()
        GlobalCoordinator.shared.navigate(.auth(.login(someVariable: "test")))
        return true
    }
}

// Setup Global Coordinator Here
extension AppDelegate {
    func setupGlobalCoordinator() {
        GlobalCoordinator.shared = GlobalCoordinator(
            router: { destination, navigationController in
                switch destination {
                case .auth(let authDestination):
                    let navigator = AuthNavigator(
                        coordinator: GlobalCoordinator.shared,
                        navigationController: navigationController)
                    navigator.navigate(authDestination)
                case let .home(sessionId, name, accessKey):
                    assert(name == "some-name")
                    assert(accessKey == "some-accessKey")

                    let dummyVC = UIViewController()
                    dummyVC.view.backgroundColor = .brown
                    navigationController.pushViewController(dummyVC, animated: true)
                case .settings(let profileId):
                    assert(profileId == "some-profile-id")

                    let dummyVC = UIViewController()
                    dummyVC.view.backgroundColor = .red
                    navigationController.pushViewController(dummyVC, animated: true)
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
