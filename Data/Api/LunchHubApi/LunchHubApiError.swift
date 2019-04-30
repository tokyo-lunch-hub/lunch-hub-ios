//
//  LunchHubApiError.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

public extension LunchHubApi {
    struct Error: Swift.Error, Decodable {
        public let message: String
        public let code: Int?
        
        static var internalError: Error {
            return Error(message: "エラーが発生しました", code: 0)
        }
    }
}
