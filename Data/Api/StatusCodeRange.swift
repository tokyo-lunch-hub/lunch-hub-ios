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
        case 100...103:
            self = .information
        case 200...226:
            self = .success
        case 300...308:
            self = .redirection
        case 400...451:
            self = .clientError
        case 500...511:
            self = .serverError
        default:
            return nil
        }
    }
    
    init(statusCode: Int) {
        switch statusCode {
        case 100...103:
            self = .information
        case 200...226:
            self = .success
        case 300...308:
            self = .redirection
        case 400...451:
            self = .clientError
        case 500...511:
            self = .serverError
        default:
            // 不正なステータスコード
            preconditionFailure()
        }
    }
}
