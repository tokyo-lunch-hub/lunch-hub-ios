//
//  User.swift
//  Model
//
//  Created by Atsushi Miyake on 2019/05/01.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import Extension
import SwiftExtensions

public struct User: Decodable {
    public let firstNameKana: String
    public let lastNameKana: String
    public let phoneNumber: String
    public let lastLoggedInAt: StringDecodableBox<Date>
}
