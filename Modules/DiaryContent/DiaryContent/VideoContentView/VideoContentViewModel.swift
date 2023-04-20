//
//  VideoContentViewModel.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/15.
//

import Foundation

public protocol VideoContentViewModelProtocol {}

public final class VideoContentViewModel: VideoContentViewModelProtocol {

    private let videoURLString: String
    private let title: String
    private let content: String

    public init(videoURLString: String,
         title: String,
         content: String) {
        self.videoURLString = videoURLString
        self.title = title
        self.content = content
    }
}
