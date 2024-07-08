//
//  LicenseFile.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/8/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct LicenseFile {
    let name: String
    let fileExtension: String

    public init(name: String, fileExtension: String) {
        self.name = name
        self.fileExtension = fileExtension
    }
}
