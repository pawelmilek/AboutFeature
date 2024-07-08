//
//  ReleasedDevicesRepository.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 5/27/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct ReleasedDevicesRepository: DevicesRepository {
    private let dataSource: DevicesDataSource

    public init(dataSource: DevicesDataSource) {
        self.dataSource = dataSource
    }

    public func devices() throws -> [Device] {
        try dataSource.devices()
    }
}
