//
//  Asset.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/17.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation

struct Asset {
    let imageUrl: String
    let name: String
    let collectionName: String
    let description: String?
    let permalink: String
}

extension Asset: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case name
        case collection
        case description
        case permalink
    }
    
    private enum NestedCodingKeys: String, CodingKey {
        case name
    }

    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            imageUrl = try container.decode(String.self, forKey: .imageUrl)
            name = try container.decode(String.self, forKey: .name)
            description = try? container.decode(String.self, forKey: .description)
            permalink = try container.decode(String.self, forKey: .permalink)
            
            let nestedContainer = try container.nestedContainer(keyedBy: NestedCodingKeys.self, forKey: .collection)
            collectionName = try nestedContainer.decode(String.self, forKey: .name)
        } catch let error {
            print("Decode failed: \(#file)")
            print("Decode failed: \(error)")
            throw error
        }
    }
}

extension Asset: Hashable {}
