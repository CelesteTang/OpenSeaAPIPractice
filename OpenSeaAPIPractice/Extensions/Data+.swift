//
//  Data+.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/18.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation

extension Data {
    
    func sublayerData(of key: String) throws -> Data {
        guard let json = try? JSONSerialization.jsonObject(with: self) as? JSON,
            let data = try? JSONSerialization.data(withJSONObject: json[key] as Any) else {
            throw NetworkError.dataNotFound
        }
        return data
    }
}
