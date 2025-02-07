//
//  LocalDevicesDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import Domain

public struct LocalDevicesDataSource: DevicesDataSource {
    private let releasedDevicesFile: LocalFileResource

    public init() {
        self.releasedDevicesFile = LocalFileResource(
            name: "released_devices",
            fileExtension: "json",
            bundle: Bundle.module
        )
    }

    public func devices() async throws -> Data {
        let url = try fileURL()
        return try Data(contentsOf: url)
    }

    private func fileURL() throws -> URL {
        guard let path = releasedDevicesFile.bundle.url(
            forResource: releasedDevicesFile.name,
            withExtension: releasedDevicesFile.fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return path
    }
}
