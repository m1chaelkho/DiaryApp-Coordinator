//
//  AppCoordinator.swift
//  DiaryFoundation
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public final class AppCoordinator: CoordinatorImpl {
    // Should be handling for tabBar Coordinator
    // TabBarCoordinator should persistence and not removable
    // AppCoordinator will not have `start()` function and only rely on TabBarCoordinator
    private var persistentCorodinators: [Coordinator] = []

    public func resetCoordinators() {
        childCoordinators.forEach { coordinator in
            coordinator.removeAllChild()
        }
        childCoordinators.removeAll()

        persistentCorodinators.forEach { coordinator in
            coordinator.removeAllChild()
        }
    }

    public func addPersistentCoordinator(_ coordinator: Coordinator) {
        persistentCorodinators.append(coordinator)
        coordinator.parent = self
        coordinator.start()
    }
}
