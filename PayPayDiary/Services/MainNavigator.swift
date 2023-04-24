//
//  MainNavigator.swift
//  PayPayDiary
//
//  Created by Michael Kho on 2023/04/24.
//

import Authentication
import DiaryContent
import DiaryCoordinator
import Settings

final class MainNavigator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigate(_ destination: GlobalDestination) {
        switch destination {
        case .auth(let authenticationDestination):
            let navigator = AuthNavigator(navigationController: navigationController)
            navigator.navigate(authenticationDestination)
        case .settings(let settingDestination):
            let navigator = SettingsNavigator(navigationController: navigationController)
            navigator.navigate(settingDestination)
        case .home(let sessionId, let name, let accessKey):
            print("context: \(sessionId) \(name) \(accessKey)")
            let homeVC = HomeViewController()
            navigationController.pushViewController(homeVC, animated: true)
        case .content(let diaryContentDestination):
            let navigator = DiaryContentNavigator(
                navigationController: navigationController)
            navigator.navigate(diaryContentDestination)
        case .back:
            navigationController.popViewController(animated: true)
        case .popToRootVC:
            navigationController.popToRootViewController(animated: true)
        }
    }
}
