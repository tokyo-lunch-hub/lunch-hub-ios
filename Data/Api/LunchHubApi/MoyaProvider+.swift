//
//  MoyaProvider+.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxMoya

extension Reactive where Base: MoyaProviderType {
    
    func _request<T>(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Observable<T> where T: Decodable {
        return self.request(token, callbackQueue: callbackQueue)
            .asObservable()
            .intercept()
    }
    
    func _request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Observable<Void> {
        return self.request(token, callbackQueue: callbackQueue)
            .asObservable()
            .intercept()
    }
}
