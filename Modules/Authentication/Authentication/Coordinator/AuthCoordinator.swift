//
//  AuthCoordinator.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import DiaryFoundation
import UIKit

public protocol AuthCoordinatorProtocol {
    func navigateToLoginViewController()
    func navigateToOTPViewController(viewModel: OTPViewModelProtocol)
    func navigateToSettingsPage(profileId: String)
    func navigateToDiaryHome(sessionId: String)
    func popViewController()
}

public final class AuthCoordinator: BaseCoordinator, AuthCoordinatorProtocol {

    private var secretPassword: String

    public init(navigationController: UINavigationController,
                secretPassword: String) {
        self.secretPassword = secretPassword
        super.init(navigationController: navigationController)
    }

    public override func start() {
        guard secretPassword == "test" else { return }
        navigateToLoginViewController()
    }
}

extension AuthCoordinator {
    public func navigateToLoginViewController() {
        let vm = AuthViewModel(coordinator: self)
        let vc = AuthViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    public func navigateToOTPViewController(viewModel: OTPViewModelProtocol) {
        let vc = OTPViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    public func navigateToSettingsPage(profileId: String) {
        guard let appCoordinator = getAppCoordinator() else { return }
        appCoordinator.navigateTo(destination: .settingPage(profileId: "profileId"))
    }

    public func navigateToDiaryHome(sessionId: String) {
        guard let appCoordinator = getAppCoordinator() else { return }
        appCoordinator.navigateTo(destination: .homePage(
            name: "some-name",
            accessKey: "some-accessKey"))

        parent?.removeChildCoordinator(self)
    }

    public func popViewController() {
        navigationController.popViewController(animated: true)
    }
}
