//
//  UserDeviceService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutDomain

public struct UserDeviceService: DeviceService {
    private let repository: DevicesRepository

    public init(repository: DevicesRepository) {
        self.repository = repository
    }

    public func deviceName(with id: String) async throws -> String {
        let devices = try await repository.devices()
        let userDevice = devices.first(where: { $0.identifier == id }) ?? Device(identifier: id, model: id)
        return userDevice.model
    }
}
