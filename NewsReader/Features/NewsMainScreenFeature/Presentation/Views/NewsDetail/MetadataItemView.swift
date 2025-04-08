//
//  MetadataItemView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct MetadataItemView: View {
    let icon: String
    let text: String?
    
    var body: some View {
        Group {
            if let text = text {
                Label {
                    Text(text)
                        .font(.subheadline)
                } icon: {
                    Image(systemName: icon)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

