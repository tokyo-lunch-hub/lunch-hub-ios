//
//  LunchHubApiEndpoint.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Moya

protocol LunchHubApiEndpoint: TargetType {}

extension LunchHubApiEndpoint {
    
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
}

