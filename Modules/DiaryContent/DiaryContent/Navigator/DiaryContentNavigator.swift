//
//  DiaryContentNavigator.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/15.
//

import DiaryCoordinator

public final class DiaryContentNavigator {

    private let coordinator: GlobalCoordinatorProtocol
    private let navigationController: UINavigationController

    public init(coordinator: GlobalCoordinatorProtocol = GlobalCoordinator.shared,
                navigationController: UINavigationController) {
        self.coordinator = coordinator
        self.navigationController = navigationController
    }

    public func navigate(_ destination: DiaryContentDestination) {
        switch destination {
        case let .imageContent(title, content, urlString):
            navigateToImageContentViewController(
                title: title,
                content: content,
                url: urlString)
        case let .videoContent(title, content, urlString):
            navigateToVideoContentViewController(
                title: title,
                content: content,
                url: urlString)
        }
    }
}

private extension DiaryContentNavigator {
    func navigateToImageContentViewController(title: String, content: String, url: String) {
        let vm = ImageContentViewModel(imageURLString: url,
                                       title: title,
                                       content: content)
        let vc = ImageContentViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToVideoContentViewController(title: String, content: String, url: String) {
        let vm = VideoContentViewModel(videoURLString: url,
                                       title: title,
                                       content: content)
        let vc = VideoContentViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
