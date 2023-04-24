//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import DiaryCoordinator
import Foundation

public protocol OTPViewModelProtocol {
    func goToSettingsButtonDidTapped()
    func confirmButtonDidTapped()
    func cancelButtonDidTapped()
}

public final class OTPViewModel: OTPViewModelProtocol {

    private var coordinator: GlobalCoordinatorProtocol

    init(coordinator: GlobalCoordinatorProtocol = GlobalCoordinator.shared) {
        self.coordinator = coordinator
    }

    public func goToSettingsButtonDidTapped() {
        coordinator.navigate(.settings(
            profileId: "some-profile-id"))
    }

    public func confirmButtonDidTapped() {
        coordinator.navigate(.home(
            sessionId: "some-session-id",
            name: "some-name",
            accessKey: "some-accessKey"))
    }

    public func cancelButtonDidTapped() {
        coordinator.navigate(.back)
    }
}
