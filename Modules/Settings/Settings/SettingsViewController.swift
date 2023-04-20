//
//  SettingsViewController.swift
//  Settings
//
//  Created by Michael Kho on 2023/03/14.
//

import UIKit

class SettingsViewController: UIViewController {

    private let coordinator: SettingsCoordinatorProtocol

    init(coordinator: SettingsCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: "SettingsViewController", bundle: .SettingsBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator.finish()
    }
}
