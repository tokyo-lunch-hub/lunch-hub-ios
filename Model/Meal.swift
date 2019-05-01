//
//  Meal.swift
//  Model
//
//  Created by Atsushi Miyake on 2019/05/01.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

public struct Meal: Decodable {
    public let id: String
    public let name: String
    public let description: String
    public let price: Int
}
