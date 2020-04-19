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
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(self.viewModel.assets.chunked(into: viewModel.gridCount).enumerated()), id: \.element) { (index, assets) in
                    AssetsCollectionView(assets: assets)
                        .onAppear {
                            if index == self.viewModel.assets.chunked(into: self.viewModel.gridCount).count - 1 {
                                self.isLoading = true
                                self.viewModel.fetchAssets()
                            }
                        }
                }
                if isLoading {
                    HStack {
                        Spacer()
                        Text("Loading...")
                        Spacer()
                    }
                }
            }
            .navigationBarTitle(viewModel.navigationBarTitle)
            .hideSeparator()
            .onReceive(viewModel.$assets) { _ in
                self.isLoading = false
            }
        }
    }
}
