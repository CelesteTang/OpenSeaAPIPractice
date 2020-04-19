//
//  ImageCollectionView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation
import SwiftUI

struct AssetsCollectionView: View {
    
    let assets: [Asset]
    
    private var gridWidth: CGFloat {
        (UIScreen.main.bounds.width - 32) / CGFloat(self.assets.count)
    }
    
    var body: some View {
        HStack {
            ForEach(self.assets, id: \.self) { asset in
                ActivableNavigationLink(destination: AssetDetailView(asset: asset)) {
                    VStack {
                        Group {
                            AsyncImage(url: asset.imageUrl,
                                       placeholder: Text("Loading ..."))
                                .frame(width: self.gridWidth, height: self.gridWidth)
                            Text(asset.name)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
    }
}
