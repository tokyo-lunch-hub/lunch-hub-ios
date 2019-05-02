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

struct FailureResponseInterceptor: ResponseInterceptorable {
    
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable {
        return self.errorHandle(response: response)
    }
    
    func intercept(response: Response) -> Observable<Void>? {
        return self.errorHandle(response: response)
    }
    
    private func errorHandle<T>(response: Response) -> Observable<T>? {
        switch response.statusCode {
        case 400...600:
            guard let error = try? response.map(LunchHubApi.Error.self, using: .snakeCaseDecoder) else {
                return .error(LunchHubApi.Error.internalError)
            }
            return .error(error)
        default: return nil
        }
    }
}
