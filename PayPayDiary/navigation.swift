//
//  navigation.swift
//  PayPayDiary
//
//  Created by adityo.rancaka on 2023/04/20.
//

import UIKit

// Module Router
class Coordinator<Destination> {

    let parentViewController: UIViewController
    let router: (Destination, UIViewController) -> Void

    init(router: @escaping (Destination, UIViewController) -> Void, parentViewController: UIViewController) {
        self.router = router
        self.parentViewController = parentViewController
    }

    func route(_ destination: Destination) {
        router(destination, parentViewController)
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

func worldRouter(_ destination: WorldDestination, parentViewController: UIViewController) {
    switch destination {
    case .japan(let japanDestination):
        japanRouter(japanDestination, parentViewController: parentViewController)
    case .indonesia(let indonesiaDestination):
        indonesiaRouter(indonesiaDestination, parentViewController: parentViewController)
    }
}

func japanRouter(_ destination: JapanDestination, parentViewController: UIViewController) {
    switch destination {
    case .tokyo(let param):
        let tokyo = Tokyo(param: param)
        parentViewController.navigationController?.pushViewController(tokyo, animated: true)
    case .osaka:
        let osaka = Osaka()
        parentViewController.navigationController?.pushViewController(osaka, animated: true)
    }
}

func indonesiaRouter(_ destination: IndonesiaDestination, parentViewController: UIViewController) {
    switch destination {
    case .jakarta:
        let jakarta = Jakarta()
        parentViewController.navigationController?.pushViewController(jakarta, animated: true)
    case .bali:
        let bali = Bali()
        parentViewController.navigationController?.pushViewController(bali, animated: true)
    }
}


// Module app
// import Router
struct Something {
    static let shared = Coordinator(
        router: worldRouter,
        parentViewController: UINavigationController(rootViewController: UIViewController())
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
