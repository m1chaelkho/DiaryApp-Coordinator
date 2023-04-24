//
//  AuthNavigator.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import DiaryCoordinator
import UIKit

public final class AuthNavigator {

    private let coordinator: GlobalCoordinatorProtocol
    private let navigationController: UINavigationController

    public init(coordinator: GlobalCoordinatorProtocol = GlobalCoordinator.shared,
                navigationController: UINavigationController) {
        self.coordinator = coordinator
        self.navigationController = navigationController
    }

    public func navigate(_ destination: AuthenticationDestination) {
        switch destination {
        case .login(let someVariable):
            guard someVariable == "test" else { return }
            navigateToLoginViewController()
        case .otp:
            navigateToOTPViewController()
        }
    }
}

private extension AuthNavigator {
    func navigateToLoginViewController() {
        let vm = AuthViewModel()
        let vc = AuthViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToOTPViewController() {
        let vm = OTPViewModel()
        let vc = OTPViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
