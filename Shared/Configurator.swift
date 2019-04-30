//
//  Configurator.swift
//  Shared
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import SwiftExtensions

protocol RoutableViewController: StoryboardInstantiatable where Self: UIViewController {
    associatedtype VCConfigurator: Configurator
    associatedtype Dependency
    static func viewController(with dependency: Dependency) -> Self
}

extension RoutableViewController where VCConfigurator.VC == Self {
    static func viewController(with dependency: Dependency) -> Self {
        let vc = Self.instantiate()
        VCConfigurator.configure(with: vc, dependency: dependency)
        return vc
    }
}

extension RoutableViewController where VCConfigurator.VC == Self, Dependency == Void {
    static func viewController() -> Self {
        let vc = Self.instantiate()
        VCConfigurator.configure(with: vc, dependency: ())
        return vc
    }
}

protocol Configurator {
    associatedtype VC: RoutableViewController
    static func configure(with vc: VC, dependency: VC.Dependency)
}
