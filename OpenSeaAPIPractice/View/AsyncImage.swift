//
//  AsyncImage.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct AsyncImage: View {
    
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        AnimatedImage(url: URL(string: url))
            .placeholder {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
            .transition(.fade)
            .resizable()
            .scaledToFit()
    }
}
