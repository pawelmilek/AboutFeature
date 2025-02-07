//
//  BundledApplicationInfo.swift
//  AboutFeature
//
//  Created by Pawel Milek on 2/7/25.
//

import Foundation
import SwiftUI

@MainActor
public struct BundledApplicationInfo: ApplicationInfo {
    public let name: String
    public let version: String
    public let deviceId: String
    public let system: String
    public let compatibility: String

    public init(bundle: Bundle, currentDevice: UIDevice) {
        self.name = bundle.applicationName
        self.version = "\(bundle.versionNumber) (\(bundle.buildNumber))"
        self.deviceId = currentDevice.identifier
        self.system = "\(currentDevice.systemName): \(currentDevice.systemVersion)"
        self.compatibility = "iOS \(bundle.minimumOSVersion)"
    }
}
