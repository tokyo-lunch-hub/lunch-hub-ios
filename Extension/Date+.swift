//
//  Date+.swift
//  Extension
//
//  Created by Atsushi Miyake on 2019/05/01.
//  Copyright © 2019 Tokyo Lunch Hub. All rights reserved.
//

import Foundation
import SwiftExtensions

extension Date: LosslessStringConvertible {
    public init?(_ description: String) {
        let formatter = DateFormatter.from(locale: Locale(identifier: "ja_JP"), format: "yyyy-MM-dd'T'HH:mm:ss.SSSSZZZZ")
        guard let date = formatter.date(from: description) else { return nil }
        self = date
    }
}
