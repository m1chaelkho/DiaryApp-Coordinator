//
//  SceneDelegate.swift
//  PayPayDiary
//
//  Created by Michael Kho on 2023/03/10.
//

import Authentication
import DiaryContent
import DiaryFoundation
import Settings
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinator = AppCoordinator()
    var navigationController: UINavigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let authCoordinator = AuthCoordinator(
            navigationController: navigationController,
            secretPassword: "test")
        appCoordinator.startChild(authCoordinator)

        // Lets say we want to add UserDefaults to safe user logic
        // We can do validation here
        /// if UserDefault.profileId != nil {
        ///  navigateTo(destination: .homePage(name: "some-name", accessKey: "some-accessKey"))
        /// } else {
        ///  appCoordinator.startChild(authCoordinator)
        /// }

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

// MARK: - SceneDelegate+AppCoordinatorProtocol
// Put it here for the sake of simplicity
// It should be on seperated file SceneDelegate+AppCoordinatorProtocol.swift
extension SceneDelegate: AppCoordinatorProtocol {

    func navigateTo(destination: Destination) {
        switch destination {
        case let .homePage(name, accessKey):
            print("context: \(name) \(accessKey)")
            let homeVC = HomeViewController()
            navigationController = UINavigationController(rootViewController: homeVC)
            window?.rootViewController = navigationController
        case let .settingPage(profileId):
            print("context: \(profileId)")
            let coordinator = SettingsCoordinator(navigationController: navigationController)
            appCoordinator.startChild(coordinator)
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
        }
    }
}
