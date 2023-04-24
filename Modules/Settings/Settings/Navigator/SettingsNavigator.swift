//
//  SettingsNavigator.swift
//  Settings
//
//  Created by Michael Kho on 2023/03/14.
//

import DiaryCoordinator
import UIKit

public final class SettingsNavigator {

    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func navigate(_ destination: SettingsDestination) {
        switch destination {
        case .settings(let profileId):
            navigationController.pushViewController(
                SettingsViewController(profileId: profileId),
                animated: true)
        }
    }
}
