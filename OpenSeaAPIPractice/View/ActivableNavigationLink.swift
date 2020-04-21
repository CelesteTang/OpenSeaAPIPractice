//
//  ActivableNavigationLink.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/19.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI

struct ActivableNavigationLink<Destination: View, Content: View>: View {
    
    private let destination: Destination
    private let content: () -> Content

    @State private var isLinkActive: Bool = false

    init(destination: Destination, @ViewBuilder content: @escaping () -> Content) {
        self.destination = destination
        self.content = content
    }

    var body: some View {
        ZStack {
            if self.isLinkActive {
                NavigationLink(destination: destination, isActive: $isLinkActive) { Color.clear }
                    .frame(height: 0)
            }
            content()
        }
        .onTapGesture {
            self.isLinkActive = true
        }
    }
}
