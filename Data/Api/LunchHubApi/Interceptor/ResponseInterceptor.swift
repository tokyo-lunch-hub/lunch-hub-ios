//
//  ResponseInterceptor.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import SwiftExtensions

extension LunchHubApi {
    enum ResponseInterceptor: CaseIterable {
        case success
        case failure
        var interceptor: ResponseInterceptorable {
            switch self {
            case .success: return SuccessResponseInterceptor()
            case .failure: return FailureResponseInterceptor()
            }
        }
    }
}

protocol ResponseInterceptorable {
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable
    func intercept(response: Response) -> Observable<Void>?
}
