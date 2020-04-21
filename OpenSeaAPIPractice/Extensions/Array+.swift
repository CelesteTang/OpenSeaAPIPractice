//
//  Array+.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation

extension Array {
    
    /// Split array into stride, ex: [1, 2, 3, 4] -> [[1, 2], [3, 4]]
    /// - Parameter size: The count of chunked array, ex: 2
    /// - Returns: The array of chunked array
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
