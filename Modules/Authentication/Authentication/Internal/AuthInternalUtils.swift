//
//  AuthInternalUtils.swift
//  Authentication
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public extension Bundle {
    private class TempClassForBundle {}

    static let AuthBundle: Bundle = {
        let classBundle: Bundle = Bundle(for: TempClassForBundle.self)

        guard let url: URL = classBundle.url(forResource: "AuthenticationResources",
                                             withExtension: "bundle"),
              let bundle: Bundle = Bundle(url: url) else {
            return Bundle(for: TempClassForBundle.self)
        }
        return bundle
    }()
}
