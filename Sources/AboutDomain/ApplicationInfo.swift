//
//  ApplicationInfo.swift
//  AboutFeature
//
//  Created by Pawel Milek on 2/7/25.
//

import Foundation

@MainActor
public struct ApplicationInfo {
    public let name: String
    public let version: String
    public let deviceId: String
    public let system: String
    public let compatibility: String

    public init(name: String, version: String, deviceId: String, system: String, compatibility: String) {
        self.name = name
        self.version = version
        self.deviceId = deviceId
        self.system = system
        self.compatibility = compatibility
    }
}
