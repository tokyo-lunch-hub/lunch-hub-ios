//
//  StatusCodeRange.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/05/03.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

enum StatusCodeRange: RawRepresentable {
    
    case information
    case success
    case redirection
    case clientError
    case serverError

    var rawValue: ClosedRange<Int> {
        switch self {
        case .information:
            return 100...103
        case .success:
            return 200...226
        case .redirection:
            return 300...308
        case.clientError:
            return 400...451
        case .serverError:
            return 500...511
        }
    }
    
    init?(rawValue: ClosedRange<Int>) {
        switch rawValue {
        case StatusCodeRange.information.rawValue:
            self = .information
        case StatusCodeRange.success.rawValue:
            self = .success
        case StatusCodeRange.redirection.rawValue:
            self = .redirection
        case StatusCodeRange.clientError.rawValue:
            self = .clientError
        case StatusCodeRange.serverError.rawValue:
            self = .serverError
        default:
            return nil
        }
    }
    
    init(statusCode: Int) {
        switch statusCode {
        case StatusCodeRange.information.rawValue:
            self = .information
        case StatusCodeRange.success.rawValue:
            self = .success
        case StatusCodeRange.redirection.rawValue:
            self = .redirection
        case StatusCodeRange.clientError.rawValue:
            self = .clientError
        case StatusCodeRange.serverError.rawValue:
            self = .serverError
        default:
            // 不正なステータスコード
            preconditionFailure()
        }
    }
}
