//
//  GlobalDestination.swift
//  Coordinator
//
//  Created by Michael Kho on 2023/04/24.
//

import Foundation

public enum GlobalDestination {
    case auth(AuthenticationDestination)
    case settings(profileId: String)
    case home(sessionId: String, name: String, accessKey: String)
    case content
    case back
    case popToRootVC
}
