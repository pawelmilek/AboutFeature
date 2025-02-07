//
//  DevicesDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutDomain

public protocol DevicesDataSource {
    func devices() async throws -> Data
}
