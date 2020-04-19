//
//  AssetDetailView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI

struct AssetDetailView: View {
    
    var asset: Asset
    // TODO: add cache
    var image: AsyncImage<Text> { AsyncImage(url: asset.imageUrl,
                                             placeholder: Text("Loading ...")) }
    
    var body: some View {
        VStack {
            List {
                image
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .aspectRatio(contentMode: .fit)
                Text(asset.name)
                Text(asset.description ?? "")
                    .multilineTextAlignment(.leading)
            }
            Button("Permalink") {
                // TODO: open web view
            }
        }
        .navigationBarTitle(Text(asset.collectionName), displayMode: .inline)
        .hideSeparator()
    }
}
