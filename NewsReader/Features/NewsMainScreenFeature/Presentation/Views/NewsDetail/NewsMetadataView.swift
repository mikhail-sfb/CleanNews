//
//  NewsMetadataView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct NewsMetadataView: View {
    let title: String?
    let author: String?
    let source: String?
    let date: Date?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title ?? "Untitled Article")
                .font(.title2)
                .fontWeight(.bold)
                .lineSpacing(4)
            
            VStack(alignment: .leading, spacing: 10) {
                MetadataItemView(icon: "person.fill", text: author)
                MetadataItemView(icon: "building.fill", text: source)
                MetadataDateView(date: date)
            }
            .foregroundColor(.secondary)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
    }
}
