//
//  GlobalCoordinator.swift
//  Coordinator
//
//  Created by Michael Kho on 2023/04/24.
//

import UIKit

@propertyWrapper
public struct Once<Value> {
    private var _wrappedValue: Value?
    public var wrappedValue: Value! {
        get { _wrappedValue }
        set {
            if _wrappedValue != nil { return }
            _wrappedValue = newValue
        }
    }

    public init() {}
}

public protocol GlobalCoordinatorProtocol {
    func navigate(_ destination: GlobalDestination)
}

public final class GlobalCoordinator: GlobalCoordinatorProtocol {

    @Once public static var shared: GlobalCoordinator!

    private let navigationController: UINavigationController
    private let router: (GlobalDestination, UINavigationController) -> Void

    public init(router: @escaping (GlobalDestination, UINavigationController) -> Void, navigationController: UINavigationController) {
        self.router = router
        self.navigationController = navigationController
    }

    public func navigate(_ destination: GlobalDestination) {
        router(destination, navigationController)
    }
}
