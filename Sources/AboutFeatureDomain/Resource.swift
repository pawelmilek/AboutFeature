//
//  Resource.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct Resource: Decodable {
    public let name: String
    public let content: String

    public init(name: String, url: String) {
        self.name = name
        self.content = url
    }
}
