//
//  LocalReleasedDevicesDataSource.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct LocalReleasedDevicesDataSource: DevicesDataSource {
    private let name: String
    private let fileExtension: String

    public init() {
        name = "device_types"
        fileExtension = "json"
    }

    public func devices() throws -> [Device] {
        let jsonData = try jsonData()
        let models = try JSONDecoder().decode([Device].self, from: jsonData)
        return models
    }

    private func jsonData() throws -> Data {
        do {
            let url = try fileURL()
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }

    private func fileURL() throws -> URL {
        guard let path = Bundle.module.url(
            forResource: name,
            withExtension: fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return path
    }
}
