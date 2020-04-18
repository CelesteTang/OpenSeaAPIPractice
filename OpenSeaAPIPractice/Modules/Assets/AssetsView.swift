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
                AsyncImage(url: asset.imageUrl,
                placeholder: Text("Loading ..."))
                Text(asset.name)
            }.frame(width: 150, height: 200)
            Spacer()
            VStack {
                AsyncImage(url: asset.imageUrl,
                placeholder: Text("Loading ..."))
                Text(asset.name)
            }.frame(width: 150, height: 200)
        }
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
