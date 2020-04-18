//
//  ImageLoader.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: String
    private var subscription: AnyCancellable?
    
    init(url: String) {
        self.url = url
    }
    
    deinit {
        subscription?.cancel()
    }

    func load() {
        guard let url = URL(string: url) else { return }
        // TODO: handle svg
        subscription = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        subscription?.cancel()
    }
}
