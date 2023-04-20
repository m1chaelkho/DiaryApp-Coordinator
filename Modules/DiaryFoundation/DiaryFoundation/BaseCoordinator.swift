//
//  BaseCoordinator.swift
//  DiaryFoundation
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation
import UIKit

open class BaseCoordinator: CoordinatorImpl {

    public var navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    open override func start() {
        fatalError("override this")
    }

    public func navigateBack() {
        navigationController.popViewController(animated: true)
    }
}

extension BaseCoordinator {

    public func getAppCoordinator() -> AppCoordinatorProtocol? {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate
        guard sceneDelegate != nil else {
            return UIApplication.shared.delegate as? AppCoordinatorProtocol
        }
        return sceneDelegate as? AppCoordinatorProtocol
    }
}
