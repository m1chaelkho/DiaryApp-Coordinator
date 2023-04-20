//
//  GlobalCoordinatorProtocol.swift
//  DiaryFoundation
//
//  Created by Michael Kho on 2023/03/13.
//

import Foundation

public protocol AppCoordinatorProtocol {
    func navigateTo(destination: Destination)
}

public enum Destination {
    case homePage(name: String, accessKey: String)
    case settingPage(profileId: String)
    case diaryContentPage(videoURLString: String?,
                          imageURLString: String?,
                          title: String,
                          content: String)

    public enum Route {
        case homePage
        case settingPage
        case diaryContentPage
    }

    public var route: Route {
        switch self {
        case .homePage: return .homePage
        case .settingPage: return .settingPage
        case .diaryContentPage: return .diaryContentPage
        }
    }
}
