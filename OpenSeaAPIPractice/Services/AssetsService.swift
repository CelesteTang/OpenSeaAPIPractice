//
//  AssetsService.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/17.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation
import Combine

protocol AssetsServiceDataPublisher {
  func publisher() -> AnyPublisher<Data, URLError>
}

struct AssetsService {
    
    private var offset: Int = 0
    
    private var url: URL {
        guard let url = urlComponents.url else { fatalError("FatalError: \(#file)") }
        return url
    }

    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.opensea.io"
        components.path = "/api/v1/assets/"
        components.setQueryItems(with: ["format": "json",
                                        "owner": "0x960DE9907A2e2f5363646d48D7FB675Cd2892e91",
                                        "offset": "\(offset)",
                                        "limit": "20"])
        return components
    }
}

extension AssetsService: AssetsServiceDataPublisher {
    
    func publisher() -> AnyPublisher<Data, URLError> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
