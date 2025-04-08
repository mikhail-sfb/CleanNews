//
//  LoadingView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 8.04.25.
//

import SwiftUI

struct LoadingView: View {
    let title: String?
    
    init(title: String = "") {
        self.title = title
    }
    
    var body: some View {
        ProgressView(title ?? "")
            .scaleEffect(1.5)
    }
}
