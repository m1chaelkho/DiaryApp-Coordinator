//
//  MockNavigationController.swift
//  AuthenticationTests
//
//  Created by Michael Kho on 2023/03/20.
//

import UIKit

final class MockNavigationController: UINavigationController {

    private var _viewControllers: [UIViewController] = []

    override internal var viewControllers: [UIViewController] {
        set {
            _viewControllers = newValue
        }
        get {
            _viewControllers
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        _viewControllers.append(viewController)
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        let lastVC = _viewControllers.last
        _viewControllers = _viewControllers.dropLast()
        return lastVC
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let removedVCs = _viewControllers
        _viewControllers = []
        return removedVCs
    }
}
