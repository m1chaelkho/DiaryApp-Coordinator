//
//  VideoContentViewController.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/15.
//

import UIKit

class VideoContentViewController: UIViewController {

    private let viewModel: VideoContentViewModelProtocol

    public init(viewModel: VideoContentViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "VideoContentViewController", bundle: .DiaryContentBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diary Content Video"
    }
}
