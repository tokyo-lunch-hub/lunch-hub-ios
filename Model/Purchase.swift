//
//  Purchase.swift
//  Model
//
//  Created by Atsushi Miyake on 2019/05/01.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import Extension
import SwiftExtensions

public struct Purchase: Decodable {
    public let id: String
    public let userId: String
    public let status: Status
    public let preparedAt: StringDecodableBox<Date>
    public let meals: [Meal]
}

public extension Purchase {
    enum Status: Int, Decodable {
        case created
    }
}
