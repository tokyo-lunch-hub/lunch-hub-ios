//
//  LunchHubApi.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

public struct LunchHubApi {
    
    public static let shared = LunchHubApi()
    private init() {}
    
    public static func changeHost(to apiHost: LunchHubApiHost) {
        lunchHubApiHost = apiHost
    }
}
