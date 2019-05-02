//
//  ForceTransitionInterceptor.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/05/02.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import SwiftExtensions

struct ForceTransitionInterceptor: ResponseInterceptorable {
    
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable {
        return self.forceTransitionHandle(response: response)
    }
    
    func intercept(response: Response) -> Observable<Void>? {
        return self.forceTransitionHandle(response: response)
    }
    
    private func forceTransitionHandle<T>(response: Response) -> Observable<T>? {
        switch StatusCodeRange(statusCode: response.statusCode) {
        case .clientError, .serverError:
            guard let error = try? response.map(LunchHubApi.Error.self, using: .snakeCaseDecoder) else { return nil }
            if let route = LunchHubApi.ForceTransitionRoute(statusCode: response.statusCode, error: error) {
                LunchHubApi.shared.triggerForceTransition.onNext(route)
                return .empty()
            } else {
                return .error(error)
            }
        default: return nil
        }
    }
}

public extension LunchHubApi {
    enum ForceTransitionRoute {
        case logout
        case requireUpdate
        case maintenance
        case ban
    }
}

extension LunchHubApi.ForceTransitionRoute {
    init?(statusCode: Int, error: LunchHubApi.Error) {
        switch (statusCode, error.code) {
        case (400...451, _):
            self = .logout
        case (503, 1):
            self = .requireUpdate
        case (503, 2):
            self = .maintenance
        case (503, 3):
            self = .ban
        default:
            return nil
        }
    }
}
