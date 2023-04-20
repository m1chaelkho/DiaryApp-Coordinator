//
//  HomeViewController.swift
//  SandboxApp
//
//  Created by Michael Kho on 2023/04/06.
//

import DiaryFoundation
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToImageContentViewButtonTapped(_ sender: Any) {
        guard let appCoordinator = UIApplication.shared.delegate as? AppCoordinatorProtocol else {
            return
        }
        appCoordinator.navigateTo(destination:
                .diaryContentPage(
                    videoURLString: nil,
                    imageURLString: "some-url",
                    title: "some-title",
                    content: "some-content"))
    }

    @IBAction func goToVideoContentViewButtonTapped(_ sender: Any) {
        guard let appCoordinator = UIApplication.shared.delegate as? AppCoordinatorProtocol else {
            return
        }
        appCoordinator.navigateTo(destination:
                .diaryContentPage(
                    videoURLString: "some-url",
                    imageURLString: nil,
                    title: "some-title",
                    content: "some-content"))
    }
}
