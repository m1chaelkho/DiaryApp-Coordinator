//
//  DiaryContentDestination.swift
//  DiaryCoordinator
//
//  Created by Michael Kho on 2023/04/24.
//

import Foundation

public enum DiaryContentDestination {
    case imageContent(title: String, content: String, urlString: String)
    case videoContent(title: String, content: String, urlString: String)
}
