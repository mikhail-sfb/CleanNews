//
//  MetadataDateView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct MetadataDateView: View {
    let date: Date?
    
    var body: some View {
        Group {
            if let date = date {
                Label {
                    Text(date, style: .date)
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "calendar")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
