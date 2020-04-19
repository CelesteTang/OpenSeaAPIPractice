//
//  AssetsViewModel.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/17.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

typealias JSON = [String: Any]

final class AssetsViewModel: ObservableObject {
    
    @Published var assets: [Asset] = []
    
    let gridCount: Int = 2
    let navigationBarTitle: String = "Asset list"
    
    private let decoder = JSONDecoder()
    private var assetsService: AssetsServiceDataPublisher
    private var assetSubscriptions = Set<AnyCancellable>()
    
    init(assetsService: AssetsServiceDataPublisher = AssetsService()) {
        self.assetsService = assetsService
        fetchAssets()
    }
    
    func fetchAssets() {
        
        assetSubscriptions = []
        
        assetsService.publisher()
            .print()
            .tryMap({ (data) -> Data in
                do {
                    return try data.sublayerData(of: "assets")
                } catch {
                    throw error
                }
            })
            .decode(type: [Asset].self, decoder: self.decoder)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { _ in
                print("Network request data received")
                self.assetsService.loadMore()
            })
            .map { [unowned self] newAssets in
                self.assets + newAssets
            }
            .assign(to: \.assets, on: self)
            .store(in: &assetSubscriptions)
    }
}
