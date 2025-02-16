//
//  AppResources.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct AppResources: Decodable {
    public let appIdentifier: String
    public let resources: [Resource]

    public init(appIdentifier: String, resources: [Resource]) {
        self.appIdentifier = appIdentifier
        self.resources = resources
    }
}
