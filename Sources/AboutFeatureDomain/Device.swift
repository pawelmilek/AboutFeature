//
//  Device.swift
//  SwiftyForecast
//
//  Created by Pawel Milek on 5/5/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct Device: Decodable {
    public let identifier: String
    public let model: String

    public init(identifier: String, model: String) {
        self.identifier = identifier
        self.model = model
    }
}
