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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.assets.chunked(into: viewModel.gridCount), id: \.self) {
                    ImageCollectionView<Asset>(elements: $0)
                }
            }.navigationBarTitle(viewModel.navigationBarTitle)
        }
    }
}
