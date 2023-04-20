//
//  navigation.swift
//  PayPayDiary
//
//  Created by adityo.rancaka on 2023/04/20.
//

import UIKit

// Module Router
class Coordinator<Destination> {

    let navigationController: UINavigationController
    let router: (Destination, UINavigationController) -> Void

    init(router: @escaping (Destination, UINavigationController) -> Void, navigationController: UINavigationController) {
        self.router = router
        self.navigationController = navigationController
    }

    func route(_ destination: Destination) {
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

func worldRouter(_ destination: WorldDestination, navigationController: UINavigationController) {
    switch destination {
    case .japan(let japanDestination):
        japanRouter(japanDestination, navigationController: navigationController)
    case .indonesia(let indonesiaDestination):
        indonesiaRouter(indonesiaDestination, navigationController: navigationController)
    }
}

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

func indonesiaRouter(_ destination: IndonesiaDestination, navigationController: UINavigationController) {
    switch destination {
    case .jakarta:
        let jakarta = Jakarta()
        navigationController.pushViewController(jakarta, animated: true)
    case .bali:
        let bali = Bali()
        navigationController.pushViewController(bali, animated: true)
    }
}


// Module app
// import Router
struct Something {
    static let shared = Coordinator(
        router: worldRouter,
        navigationController: UINavigationController(rootViewController: UIViewController())
    )
}

// Module Japan
// import Router
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
        Something.shared.route(.indonesia(.jakarta))
    }
}

class Osaka: UIViewController {}

// Module Indonesia
// import Router
class Jakarta: UIViewController {}
class Bali: UIViewController {}
