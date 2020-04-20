//
//  AssetsView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/17.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI

struct AssetsView: View {
    
    @ObservedObject private var viewModel: AssetsViewModel = AssetsViewModel()
    @State private var isFetchingMore: Bool = false
    
    private var gridWidth: CGFloat {
        (UIScreen.main.bounds.width - 32) / CGFloat(viewModel.gridCount)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(self.viewModel.assets.chunked(into: viewModel.gridCount).enumerated()), id: \.element) { (index, assets) in
                    AssetsCollectionView(assets: assets, gridWidth: self.gridWidth)
                        .onAppear {
                            if index == self.viewModel.assets.chunked(into: self.viewModel.gridCount).count - 1 {
                                self.isFetchingMore = true
                                self.viewModel.fetchAssets()
                            }
                        }
                }
                Text("Fetching...")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .opacity(isFetchingMore ? 1 : 0)
            }
            .navigationBarTitle(viewModel.navigationBarTitle)
            .hideSeparator()
            .onReceive(viewModel.$assets) { _ in
                self.isFetchingMore = false
            }
        }
    }
}
