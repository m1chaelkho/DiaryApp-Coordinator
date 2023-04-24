//
//  HomeViewController.swift
//  SandboxApp
//
//  Created by Michael Kho on 2023/04/06.
//

import DiaryCoordinator
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToImageContentViewButtonTapped(_ sender: Any) {
        GlobalCoordinator.shared.navigate(.content(.imageContent(
            title: "abc",
            content: "abc",
            urlString: "abc")))
    }

    @IBAction func goToVideoContentViewButtonTapped(_ sender: Any) {
        GlobalCoordinator.shared.navigate(.content(.videoContent(
            title: "abc",
            content: "abc",
            urlString: "abc")))
    }
}
