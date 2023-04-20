//
//  navigation.swift
//  PayPayDiary
//
//  Created by adityo.rancaka on 2023/04/20.
//

import UIKit

// Module Router
class Coordinator {

    static var shared = Coordinator(
        router: { _, _ in },
        navigationController: UINavigationController()
    )

    let navigationController: UINavigationController
    let router: (WorldDestination, UINavigationController) -> Void

    init(router: @escaping (WorldDestination, UINavigationController) -> Void, navigationController: UINavigationController) {
        self.router = router
        self.navigationController = navigationController
    }

    func route(_ destination: WorldDestination) {
        router(destination, navigationController)
    }
}

enum JapanDestination {
    case tokyo(Int)
    case osaka
}

enum IndonesiaDestination {
    case jakarta
    case bali
}

enum WorldDestination {
    case japan(JapanDestination)
    case indonesia(IndonesiaDestination)
}

// Module Main
func worldRouter(_ destination: WorldDestination, navigationController: UINavigationController) {
    switch destination {
    case .japan(let japanDestination):
        japanRouter(japanDestination, navigationController: navigationController)
    case .indonesia(let indonesiaDestination):
        indonesiaRouter(indonesiaDestination, navigationController: navigationController)
    }
}

class MainAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        Coordinator.shared = Coordinator(
            router: worldRouter,
            navigationController: UINavigationController()
        )

        return true
    }
}

// Module Japan
// import Router
class SandboxJapanDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        Coordinator.shared = Coordinator(
            router: { destination, navigationController in
                switch destination {
                case .japan(let japanDestination):
                    japanRouter(japanDestination, navigationController: navigationController)
                case .indonesia:
                    // asserting
                    break
                }
            },
            navigationController: UINavigationController()
        )

        return true
    }
}

class Tokyo: UIViewController {
    let param: Int

    init(param: Int) {
        self.param = param
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func gotoJakarta() {
        Coordinator.shared.route(.indonesia(.jakarta))
    }
}
class Osaka: UIViewController {}
func japanRouter(_ destination: JapanDestination, navigationController: UINavigationController) {
    switch destination {
    case .tokyo(let param):
        let tokyo = Tokyo(param: param)
        navigationController.pushViewController(tokyo, animated: true)
    case .osaka:
        let osaka = Osaka()
        navigationController.pushViewController(osaka, animated: true)
    }
}

// Module Indonesia
// import Router

class SandboxIndonesiaDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        Coordinator.shared = Coordinator(
            router: { destination, navigationController in
                switch destination {
                case .japan:
                    // asserting
                    break
                case .indonesia(let indonesiaDestination):
                    indonesiaRouter(indonesiaDestination, navigationController: navigationController)
                    break
                }
            },
            navigationController: UINavigationController()
        )

        return true
    }
}

class Jakarta: UIViewController {}
class Bali: UIViewController {}
func indonesiaRouter(_ destination: IndonesiaDestination, navigationController: UINavigationController) {
    switch destination {
    case .jakarta:
        let jakarta = Jakarta()
        navigationController.pushViewController(jakarta, animated: true)
    case .bali:
        let bali = Bali()
        navigationController.present(bali, animated: true)
    }
}
