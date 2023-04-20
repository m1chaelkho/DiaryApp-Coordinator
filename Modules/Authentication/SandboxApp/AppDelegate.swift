//
//  AppDelegate.swift
//  SandboxApp
//
//  Created by Michael Kho on 06/10/22.
//

import Authentication
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

        let coordinator = AuthCoordinator(
            navigationController: navigationController,
            secretPassword: "test")
        coordinator.start()
        
        return true
    }
}

// mock inter module navigation here
extension AppDelegate: AppCoordinatorProtocol {

    func navigateTo(destination: Destination) {
        switch destination {
        case let .homePage(name, accessKey):
            assert(name == "some-name")
            assert(accessKey == "some-accessKey")

            let dummyVC = UIViewController()
            dummyVC.view.backgroundColor = .brown
            navigationController.pushViewController(dummyVC, animated: true)
        case let .settingPage(profileId):
            assert(profileId == "some-profile-id")
            
            let dummyVC = UIViewController()
            dummyVC.view.backgroundColor = .red
            navigationController.pushViewController(dummyVC, animated: true)
        default:
            break
        }
    }
}
