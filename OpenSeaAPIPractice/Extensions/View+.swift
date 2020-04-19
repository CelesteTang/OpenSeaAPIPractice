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
}
