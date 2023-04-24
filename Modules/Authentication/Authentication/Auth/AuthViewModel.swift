//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public protocol AuthViewModelProtocol {
    func loginButtonDidTapped()
}

public final class AuthViewModel: AuthViewModelProtocol {

    private var coordinator: AuthCoordinatorProtocol

    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    public func loginButtonDidTapped() {
        coordinator.navigate(.otp)
    }
}
