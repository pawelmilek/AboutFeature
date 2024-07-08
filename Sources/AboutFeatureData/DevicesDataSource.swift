//
//  DevicesDataSource.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public protocol DevicesDataSource {
    func devices() throws -> [Device]
}
