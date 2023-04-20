//
//  NavigationTests.swift
//  PayPayDiaryTests
//
//  Created by adityo.rancaka on 2023/04/20.
//

import XCTest
@testable import PayPayDiary

class MockNavigationController: UINavigationController {

    var pushedVC: UIViewController!
    var presentedVC: UIViewController!

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedVC = viewController
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
    }
}

class JapanRouterTests: XCTestCase {

    func testRouter() {
        let navigationController = MockNavigationController()

        let coordinator = Coordinator(
            router: worldRouter,
            navigationController: navigationController
        )

        coordinator.route(.indonesia(.jakarta))
        XCTAssertTrue(navigationController.pushedVC is Jakarta)

        coordinator.route(.indonesia(.bali))
        XCTAssertTrue(navigationController.presentedVC is Bali)

        coordinator.route(.japan(.tokyo(5)))
        XCTAssertTrue(navigationController.pushedVC is Tokyo)

        coordinator.route(.japan(.osaka))
        XCTAssertTrue(navigationController.pushedVC is Osaka)
    }
}
