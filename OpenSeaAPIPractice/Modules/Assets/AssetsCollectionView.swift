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
    let gridWidth: CGFloat
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(self.assets, id: \.self) { asset in
                ActivableNavigationLink(destination: AssetDetailView(asset: asset)) {
                    VStack {
                        AsyncImage(url: asset.imageUrl)
                            .frame(width: self.gridWidth, height: self.gridWidth)
                        Text(asset.name)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}
