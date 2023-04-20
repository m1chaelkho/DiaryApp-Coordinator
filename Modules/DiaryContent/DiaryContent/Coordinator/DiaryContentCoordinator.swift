//
//  DiaryContentCoordinator.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/15.
//

import DiaryFoundation

//public protocol DiaryContentCoordinatorInput {
//    var title: String { get }
//    var content: String { get }
//}
//
//public struct DiaryContentImageContentInput: DiaryContentCoordinatorInput {
//    private(set) public var title: String
//    private(set) public var content: String
//    public let imageURLString: String
//
//    public init(title: String, content: String, imageURLString: String) {
//        self.title = title
//        self.content = content
//        self.imageURLString = imageURLString
//    }
//}
//
//public struct DiaryContentVideoContentInput: DiaryContentCoordinatorInput {
//    private(set) public var title: String
//    private(set) public var content: String
//    public let videoURLString: String
//
//    public init(title: String, content: String, videoURLString: String) {
//        self.title = title
//        self.content = content
//        self.videoURLString = videoURLString
//    }
//}

//public enum DiaryContentDestinationType {
//    case image, video
//}

public struct DiaryContentCoordinatorInput {
    public let title: String
    public let content: String
    public let imageURLString: String?
    public let videoURLString: String?
    // public let destinationType: DiaryContentDestinationType

    public init(title: String,
                content: String,
                imageURLString: String? = nil,
                videoURLString: String? = nil) {
        self.title = title
        self.content = content
        self.imageURLString = imageURLString
        self.videoURLString = videoURLString
    }
}

public final class DiaryContentCoordinator: BaseCoordinator {

    private let input: DiaryContentCoordinatorInput

    public init(navigationController: UINavigationController,
                input: DiaryContentCoordinatorInput) {
        self.input = input
        super.init(navigationController: navigationController)
    }

    public override func start() {
        // if the input not contain imageURLString or videoURLString
        // this coordinator will not start
        if let imageURLString = input.imageURLString {
            navigateToImageContentViewController(url: imageURLString)
        } else if let videoURLString = input.videoURLString {
            navigateToVideoContentViewController(url: videoURLString)
        }
    }

    func navigateToImageContentViewController(url: String) {
        let vm = ImageContentViewModel(imageURLString: url,
                                       title: input.title,
                                       content: input.content)
        let vc = ImageContentViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToVideoContentViewController(url: String) {
        let vm = VideoContentViewModel(videoURLString: url,
                                       title: input.title,
                                       content: input.content)
        let vc = VideoContentViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
