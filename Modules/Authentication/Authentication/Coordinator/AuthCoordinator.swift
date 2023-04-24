//
//  AuthCoordinator.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import DiaryFoundation
import UIKit

public enum AuthCoordinatorDestination {
    case login
    case otp
    case settings(profileId: String)
    case home(sessionId: String)
    case back
}

public protocol AuthCoordinatorProtocol {
    func navigate(_ destination: AuthCoordinatorDestination)
}

public final class AuthCoordinator: BaseCoordinator, AuthCoordinatorProtocol {

    private var secretPassword: String

    public init(navigationController: UINavigationController,
                secretPassword: String) {
        self.secretPassword = secretPassword
        super.init(navigationController: navigationController)
    }

    public override func start() {
        // if this coordinator have multi entrypoint
        // add validation here and use navigate function
        guard secretPassword == "test" else { return }
        navigate(.login)
    }

    public func navigate(_ destination: AuthCoordinatorDestination) {
        switch destination {
        case .login:
            navigateToLoginViewController()
        case .otp:
            navigateToOTPViewController()
        case .settings(let profileId):
            navigateToSettingsPage(profileId: profileId)
        case .home(let sessionId):
            navigateToDiaryHome(sessionId: sessionId)
        case .back:
            navigationController.popViewController(animated: true)
        }
    }
}

private extension AuthCoordinator {
    func navigateToLoginViewController() {
        let vm = AuthViewModel(coordinator: self)
        let vc = AuthViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToOTPViewController() {
        let viewModel = OTPViewModel(coordinator: self)
        let vc = OTPViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToSettingsPage(profileId: String) {
        guard let appCoordinator = getAppCoordinator() else { return }
        appCoordinator.navigateTo(destination: .settingPage(profileId: profileId))
    }

    func navigateToDiaryHome(sessionId: String) {
        guard let appCoordinator = getAppCoordinator() else { return }
        appCoordinator.navigateTo(destination: .homePage(
            name: "some-name-and-\(sessionId)",
            accessKey: "some-accessKey"))

        parent?.removeChildCoordinator(self)
    }
}
