//
//  LunchHubApiService.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Moya

protocol LunchHubApiService {
    associatedtype Endpoint: LunchHubApiEndpoint
    var provider: MoyaProvider<Endpoint> { get }
}
