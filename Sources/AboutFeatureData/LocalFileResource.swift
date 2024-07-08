//
//  LocalFileResource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/8/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct LocalFileResource {
    let name: String
    let fileExtension: String
    let bundle: Bundle

    public init(name: String, fileExtension: String, bundle: Bundle) {
        self.name = name
        self.fileExtension = fileExtension
        self.bundle = bundle
    }
}
