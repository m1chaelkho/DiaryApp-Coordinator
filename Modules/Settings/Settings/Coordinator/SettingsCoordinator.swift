//
//  SettingsCoordinator.swift
//  Settings
//
//  Created by Michael Kho on 2023/03/14.
//

import DiaryFoundation
import UIKit

public protocol SettingsCoordinatorProtocol {
    func navigateToSettingsPage()
    func finish()
}

public final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorProtocol {

    public override func start() {
        navigateToSettingsPage()
    }
}

extension SettingsCoordinator {
    public func navigateToSettingsPage() {
        navigationController.pushViewController(
            SettingsViewController(coordinator: self),
            animated: true)
    }

    public func finish() {
        parent?.removeChildCoordinator(self)
    }
}
