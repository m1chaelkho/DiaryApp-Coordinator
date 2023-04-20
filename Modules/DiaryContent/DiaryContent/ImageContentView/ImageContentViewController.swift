//
//  ImageContentViewController.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/14.
//

import UIKit

public final class ImageContentViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    private let viewModel: ImageContentViewModelProtocol

    public init(viewModel: ImageContentViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "ImageContentViewController", bundle: .DiaryContentBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diary Content Image"
    }
}
