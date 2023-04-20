//
//  AppDelegate.swift
//  SandboxApp
//
//  Created by Michael Kho on 06/10/22.
//

import DiaryContent
import DiaryFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController = UINavigationController()
    let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        navigationController = UINavigationController(rootViewController: HomeViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate: AppCoordinatorProtocol {
    func navigateTo(destination: Destination) {
        switch destination {
        case let .diaryContentPage(videoURLString, imageURLString, title, content):
            let input = DiaryContentCoordinatorInput(
                title: title,
                content: content,
                imageURLString: imageURLString,
                videoURLString: videoURLString)
            let coordinator = DiaryContentCoordinator(
                navigationController: navigationController,
                input: input)
            appCoordinator.startChild(coordinator)
        default:
            break
        }
    }
}
