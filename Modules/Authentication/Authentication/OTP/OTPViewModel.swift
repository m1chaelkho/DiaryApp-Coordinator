//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public protocol OTPViewModelProtocol {
    func goToSettingsButtonDidTapped()
    func confirmButtonDidTapped()
    func cancelButtonDidTapped()
}

public final class OTPViewModel: OTPViewModelProtocol {

    private var coordinator: AuthCoordinatorProtocol

    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    public func goToSettingsButtonDidTapped() {
        coordinator.navigateToSettingsPage(profileId: "some-profile-id")
    }

    public func confirmButtonDidTapped() {
        coordinator.navigateToDiaryHome(sessionId: "some-session-id")
    }

    public func cancelButtonDidTapped() {
        coordinator.popViewController()
    }
}
