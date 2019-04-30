//
//  ViewModelInjectable.swift
//  Shared
//
//  Created by Atsushi Miyake on 2019/04/30.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

public protocol ViewModelInjectable {
    associatedtype ViewModel
    func inject(_ viewModel: ViewModel)
}

public extension ViewModelInjectable where ViewModel == Void {
    func inject(_ viewModel: ()) {}
}
