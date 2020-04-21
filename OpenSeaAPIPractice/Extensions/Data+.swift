//
//  Data+.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/18.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation

extension Data {
    
    /// Get the specific layer of json
    /// - Parameter key: The key of the target layer
    /// - Throws: Error if key not fount or data format is incorrect
    /// - Returns: Data of the specific layer of json
    func sublayerData(of key: String) throws -> Data {
        guard let json = try? JSONSerialization.jsonObject(with: self) as? JSON,
            let data = try? JSONSerialization.data(withJSONObject: json[key] as Any) else {
            throw NetworkError.dataNotFound
        }
        return data
    }
}
