//
//  ReleasedDevicesRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 5/27/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct ReleasedDevicesRepository: DevicesRepository {
    private let dataSource: DevicesDataSource
    private let decoder: JSONDecoder

    public init(dataSource: DevicesDataSource, decoder: JSONDecoder) {
        self.dataSource = dataSource
        self.decoder = decoder
    }

    public func devices() async throws -> [Device] {
        let data = try await dataSource.devices()
        let models = try decoder.decode([Device].self, from: data)
        return models
    }
}
