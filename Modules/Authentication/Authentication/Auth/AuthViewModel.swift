//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import DiaryCoordinator
import Foundation

public protocol AuthViewModelProtocol {
    func loginButtonDidTapped()
}

public final class AuthViewModel: AuthViewModelProtocol {

    private var coordinator: GlobalCoordinatorProtocol

    init(coordinator: GlobalCoordinatorProtocol = GlobalCoordinator.shared) {
        self.coordinator = coordinator
    }

    public func loginButtonDidTapped() {
        let otpViewModel = OTPViewModel(coordinator: coordinator)
        coordinator.navigate(.auth(.otp))
    }
}
