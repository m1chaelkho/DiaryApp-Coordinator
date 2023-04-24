//
//  GlobalDestination.swift
//  Coordinator
//
//  Created by Michael Kho on 2023/04/24.
//

import Foundation

public enum GlobalDestination {
    case auth(AuthenticationDestination)
    case settings(SettingsDestination)
    case home(sessionId: String, name: String, accessKey: String)
    case content(DiaryContentDestination)
    case back
    case popToRootVC
}
