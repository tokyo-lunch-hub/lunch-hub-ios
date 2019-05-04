//
//  Coordinator.swift
//  Shared
//
//  Created by Atsushi Miyake on 2019/05/05.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import UIKit

public protocol Coordinator {
    associatedtype Route
    var viewController: UIViewController? { get set }
    init()
    init(viewController: UIViewController)
    func transition(to route: Route)
}

public extension Coordinator {
    public init(viewController: UIViewController) {
        self.init()
        self.viewController = viewController
    }
}
