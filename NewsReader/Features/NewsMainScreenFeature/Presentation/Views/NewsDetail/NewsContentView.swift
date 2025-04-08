//
//  NewsContentView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct NewsContentView: View {
    let content: String?
    
    var body: some View {
        Group {
            if let content = content {
                Text(content)
                    .font(.body)
                    .lineSpacing(6)
                    .padding(.horizontal)
                    .padding(.top, 8)
            }
        }
    }
}

