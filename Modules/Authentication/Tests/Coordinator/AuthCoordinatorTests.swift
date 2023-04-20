//
//  AuthCoordinatorTests.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/20.
//

import UIKit
import XCTest
import DiaryFoundation

@testable import Authentication

class AuthCoordinatorTests: XCTestCase {

    private var mockNavController = MockNavigationController()

    func testCoordinatorStart() {
        let coordinator = generateCoordinator()
        coordinator.start()

        let className = mockNavController.viewControllers.first?.nibName
        XCTAssertEqual(className!, "AuthViewController")
    }

    func testCoordinatorStartFailed() {
        let coordinator = generateCoordinator(secretPassword: "wrong secret code")
        coordinator.start()

        XCTAssert(mockNavController.viewControllers.isEmpty)
    }

    func testOTPFlow() {
        let baseCoordinator = BaseCoordinator(navigationController: mockNavController)
        let coordinator = generateCoordinator()
        baseCoordinator.startChild(coordinator)
        // CurrentViewController == AuthViewController

        // CurrentViewController should be OTPViewController
        let otpVM = OTPViewModel(coordinator: coordinator)
        coordinator.navigateToOTPViewController(viewModel: otpVM)
        let className1 = mockNavController.viewControllers.last?.nibName
        XCTAssertEqual(className1, "OTPViewController")

        // CurrentViewController should be AuthViewController (back button pressed)
        otpVM.cancelButtonDidTapped()
        let className2 = mockNavController.viewControllers.last?.nibName
        XCTAssertEqual(className2, "AuthViewController")

        /*
         CurrentViewController should be SettingsViewController
         But SettingsViewController is not on this module so its expected to stay at
         AuthViewController
        */
        otpVM.goToSettingsButtonDidTapped()
        let className3 = mockNavController.viewControllers.last?.nibName
        XCTAssertEqual(className3, "AuthViewController")

        /*
         CurrentViewController should be HomeViewController
         But SettingsViewController is not on this module so its expected to stay at
         AuthViewController
        */
        otpVM.confirmButtonDidTapped()
        let className4 = mockNavController.viewControllers.last?.nibName
        XCTAssertEqual(className4, "AuthViewController")
        XCTAssert(baseCoordinator.childCoordinators.isEmpty)
    }
}

private extension AuthCoordinatorTests {
    func generateCoordinator(secretPassword: String = "test") -> AuthCoordinator {
        return AuthCoordinator(
            navigationController: mockNavController,
            secretPassword: secretPassword)
    }
}
