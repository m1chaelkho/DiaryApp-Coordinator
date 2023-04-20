//
//  ImageContentViewModel.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/14.
//

import Foundation

public protocol ImageContentViewModelProtocol {}

public final class ImageContentViewModel: ImageContentViewModelProtocol {

    private let imageURLString: String
    private let title: String
    private let content: String

    public init(imageURLString: String,
         title: String,
         content: String) {
        self.imageURLString = imageURLString
        self.title = title
        self.content = content
    }
}
