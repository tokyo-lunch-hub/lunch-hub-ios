//
//  Shop.swift
//  Model
//
//  Created by Atsushi Miyake on 2019/05/01.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation

public struct Shop: Decodable {
    public let id: String
    public let name: String
    public let branchName: String
    public let status: Status
    public let zipcode: String
    public let prefectureId: Int
    public let address: String
    public let phoneNumber: String
}

public extension Shop {
    enum Status: Int, Decodable {
        case created
    }
}
