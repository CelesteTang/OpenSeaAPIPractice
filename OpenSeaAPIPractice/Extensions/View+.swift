//
//  View+.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/20.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI

extension View {
    
    func hideSeparator() -> some View {
        onAppear {
            UITableView.appearance().separatorColor = .clear
        }
    }

    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())        
    }
}

private struct BorderedViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
    }
}
