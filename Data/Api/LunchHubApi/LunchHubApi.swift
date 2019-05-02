//
//  LunchHubApi.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import RxSwift
import RxCocoa

public struct LunchHubApi {
    
    public static let shared = LunchHubApi()
    private init() {}
    
    fileprivate let _forceTransition = PublishSubject<ForceTransitionRoute>()
    
    public static func changeHost(to apiHost: LunchHubApiHost) {
        lunchHubApiHost = apiHost
    }
}

// MARK: - Inputs
extension LunchHubApi {
    var triggerForceTransition: AnyObserver<ForceTransitionRoute> { return self._forceTransition.asObserver() }
}

// MARK: - Outputs
public extension LunchHubApi {
    var forceTransition: Observable<ForceTransitionRoute> { return self._forceTransition }
}
