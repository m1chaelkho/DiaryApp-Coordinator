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
        coordinator.navigate(.settings(profileId: "some-profile-id"))
    }

    public func confirmButtonDidTapped() {
        coordinator.navigate(.home(sessionId: "some-session-id"))
    }

    public func cancelButtonDidTapped() {
        coordinator.navigate(.back)
    }
}
