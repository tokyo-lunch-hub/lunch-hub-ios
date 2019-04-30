//
//  LunchHubApiHost.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

var lunchHubApiHost: LunchHubApiHost = .development

public enum LunchHubApiHost {
    case development
    case staging
    case infiniteStaging(name: String)
    case production
    
    var url: URL {
        switch self {
        case .development:
            return URL(string: "https://api.lunch-hub-development.com")!
        case .staging:
            return URL(string: "https://api.lunch-hub-staging.com")!
        case let .infiniteStaging(name):
            return URL(string: "https://\(name)-api.lunch-hub-staging.com")!
        case .production:
            return URL(string:  "https://api.lunch-hub.com")!
        }
    }
}