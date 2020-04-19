//
//  ImageCollectionView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import Foundation
import SwiftUI

protocol ImageCollectionViewPresentable: Hashable {
    var url: String { get }
    var title: String { get }
}

struct ImageCollectionView<Element: ImageCollectionViewPresentable>: View {
    
    let elements: [Element]
    
    var gridWidth: CGFloat {
        (UIScreen.main.bounds.width - 32) / CGFloat(self.elements.count)
    }
    
    var body: some View {
        HStack {
            ForEach(self.elements, id: \.self) { element in
                VStack {
                    Group {
                        AsyncImage(url: element.url,
                                   placeholder: Text("Loading ..."))
                        Text(element.title)
                            .multilineTextAlignment(.center)
                    }.frame(width: self.gridWidth)
                }
            }
        }
    }
}
