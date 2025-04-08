//
//  NewsOriginalLinkView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct NewsOriginalLinkView: View {
    let url: URL?
    
    var body: some View {
        Group {
            if let url = url {
                Link(destination: url) {
                    HStack {
                        Image(systemName: "globe")
                        Text(url.host ?? "View Original")
                            .lineLimit(1)
                    }
                    .foregroundColor(.blue)
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}
