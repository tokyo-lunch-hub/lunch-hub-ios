//
//  ApplicationCoordinator.swift
//  lunch-hub
//
//  Created by Atsushi Miyake on 2019/05/05.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import UIKit
import Shared

struct ApplicationCoordinator: Coordinator {
    
    weak var viewController: UIViewController? = nil
    
    enum Route {
        case splash
    }
    
    func transition(to route: Route) {
        switch route {
        case .splash:
            // UIWindow(frame: UIScreen.main.bounds).rootViewController = SplashViewController.viewController()
            print("transition to splash view controller.")
        }
    }
}
