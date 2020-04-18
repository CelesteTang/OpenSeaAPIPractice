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
                ForEach(self.viewModel.assets, id: \.self) { asset in
                    CollectionView(asset: asset)
                }
            }.navigationBarTitle("Asset list")
        }
    }
}
struct CollectionView: View {
    
    let asset: Asset
    
    var body: some View {
        HStack {
            VStack {
                // TODO: async load image
                Spacer()
                Text(asset.name)
            }
            Spacer()
            VStack {
                // TODO: async load image
                Spacer()
                Text(asset.name)
            }
        }
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
