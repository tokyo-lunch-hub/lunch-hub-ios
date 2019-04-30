//
//  Observable+Interceptor.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension Observable where Element: Response {
    @inline(never)
    func intercept<T>() -> Observable<T> where T: Decodable {
        return self.flatMap { response -> Observable<T> in
            LunchHubApi.ResponseInterceptor.allCases
                .map { interceptor in
                    interceptor.interceptor
                }
                .compactMap { interceptor -> Observable<T>? in
                    interceptor.intercept(response: response)
                }
                .first!
            }
    }
    
    @inline(never)
    func intercept() -> Observable<Void> {
        return self
            .flatMap { response -> Observable<Void> in
                LunchHubApi.ResponseInterceptor.allCases
                .map { interceptor in
                    interceptor.interceptor
                }
                .compactMap { interceptor -> Observable<Void>? in
                    interceptor.intercept(response: response)
                }
                .first!
            }
    }
}
