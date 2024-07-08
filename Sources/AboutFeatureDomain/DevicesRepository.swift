//
//  DevicesRepository.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 5/27/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public protocol DevicesRepository {
    func devices() throws -> [Device]
}
