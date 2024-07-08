//
//  LicenseRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/4/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public protocol LicenseRepository {
    func content() throws -> URL
}
