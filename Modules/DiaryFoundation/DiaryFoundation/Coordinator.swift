//
//  Coordinator.swift
//  DiaryFoundation
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parent: Coordinator? { get set }

    func start()
    func startChild(_ childCoordinator: Coordinator)

    func addChildCoordinator(_ childCoordinator: Coordinator)
    func removeChildCoordinator(_ childCoordinator: Coordinator)
    func removeAllChild()
}

open class CoordinatorImpl: Coordinator {
    public var parent: Coordinator?
    public var childCoordinators: [Coordinator]

    public init(childCoordinators: [Coordinator] = []) {
        self.childCoordinators = childCoordinators
    }

    public func startChild(_ childCoordinator: Coordinator) {
        childCoordinator.parent = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }

    public func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.removeAll { $0 === childCoordinator }
    }

    public func removeAllChild() {
        childCoordinators.forEach { coordinator in
            // Recursive method to completely remove all nested child
            coordinator.removeAllChild()
        }
        childCoordinators.removeAll()
    }

    open func start() {
        // no-op
    }

    open func addChildCoordinator(_ childCoordinator: Coordinator) {
        // no-op
    }
}
