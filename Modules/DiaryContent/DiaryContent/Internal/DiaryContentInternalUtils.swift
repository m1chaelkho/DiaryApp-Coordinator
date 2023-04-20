//
//  DiaryContentInternalUtils.swift
//  DiaryContent
//
//  Created by Michael Kho on 2023/03/14.
//

import Foundation

public extension Bundle {
    private class TempClassForBundle {}

    static let DiaryContentBundle: Bundle = {
        let classBundle: Bundle = Bundle(for: TempClassForBundle.self)

        guard let url: URL = classBundle.url(forResource: "DiaryContentResources",
                                             withExtension: "bundle"),
              let bundle: Bundle = Bundle(url: url) else {
            return Bundle(for: TempClassForBundle.self)
        }
        return bundle
    }()
}
