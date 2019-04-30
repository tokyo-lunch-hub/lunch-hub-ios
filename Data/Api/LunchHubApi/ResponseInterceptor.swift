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

protocol ResponseInterceptor {
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable
    func intercept(response: Response) -> Observable<Void>?
}

struct SuccessResponseInterceptor: ResponseInterceptor {
    
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable {
        switch response.statusCode {
        case 200...226:
            do {
                let decoded = try response.map(T.self, using: .snakeCaseDecoder)
                return .just(decoded)
            } catch {
                return .error(LunchHubApi.Error(message: error.localizedDescription, code: 1))
            }
        default: return nil
        }
    }
    
    func intercept(response: Response) -> Observable<Void>? {
        switch response.statusCode {
        case 200...226: return .just(())
        default: return nil
        }
    }
}
