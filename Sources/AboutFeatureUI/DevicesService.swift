//
//  DeviceService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public protocol DeviceService {
    func deviceName(with id: String) -> String
}
