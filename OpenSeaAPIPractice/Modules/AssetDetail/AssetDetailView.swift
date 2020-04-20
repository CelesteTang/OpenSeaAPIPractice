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
    
    @State private var presentWebView = false
    
    var body: some View {
        VStack {
            List {
                AsyncImage(url: asset.imageUrl)
                    .frame(width: UIScreen.main.bounds.width - 32)
                Text(asset.name)
                Text(asset.description ?? "")
                    .multilineTextAlignment(.leading)
            }
            VStack(spacing: 8) {
                Text("Permalink")
                HStack {
                    Button("Browser") {
                        if let url = URL(string: self.asset.permalink) {
                            UIApplication.shared.open(url)
                        }
                    }.bordered()
                    Button("WebView") {
                        self.presentWebView = true
                    }.bordered()
                }
            }
        }
        .sheet(isPresented: $presentWebView) {
            WebView(url: self.asset.permalink)
        }
        .navigationBarTitle(Text(asset.collectionName), displayMode: .inline)
        .hideSeparator()
    }
}
