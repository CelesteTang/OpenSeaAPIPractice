//
//  AssetsView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/17.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct AssetsView: View {
    
    @ObservedObject private var viewModel: AssetsViewModel = AssetsViewModel()
    @State private var isFetchingData: Bool = false
    @State private var isFetchingMore: Bool = false
    
    private var gridWidth: CGFloat {
        (UIScreen.main.bounds.width - 32) / CGFloat(viewModel.gridCount)
    }
    
    var body: some View {
        NavigationView {
            List {
                // Header indicator
                if isFetchingData {
                    ActivityIndicator($isFetchingData, style: .large)
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                // Asset cell
                ForEach(Array(self.viewModel.assets.chunked(into: viewModel.gridCount).enumerated()), id: \.element) { (index, assets) in
                    AssetsCollectionView(assets: assets, gridWidth: self.gridWidth)
                        .onAppear {
                            if index == self.viewModel.assets.chunked(into: self.viewModel.gridCount).count - 1 {
                                self.isFetchingMore = true
                                self.viewModel.fetchAssets()
                            }
                        }
                }
                // Footer indicator
                Text("Fetching...")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .opacity(isFetchingMore ? 1 : 0)
            }
            .navigationBarTitle(viewModel.navigationBarTitle)
            .hideSeparator()
            .onReceive(viewModel.$assets) { _ in
                self.isFetchingData = false
                self.isFetchingMore = false
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                self.isFetchingData = true
            }
        }
        .onTapGesture(count: 2) {
            self.clearCache()
        }
    }

    private func clearCache() {
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk(onCompletion: nil)
    }
}
