//
//  test.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel: NewsViewModel
    
    init() {
        let container = DependencyContainer.shared
        _viewModel = StateObject(wrappedValue: container.makeNewsViewModel())
    }
    
    var body: some View {
        List(viewModel.news) {
            NewsRowView(news: $0)
        }
        .task {
            await viewModel.fetchNews(newsTopic: "Apple")
        }

    }
}

struct NewsRowView: View {
    let news: News

    var body: some View {
        VStack(alignment: .leading) {
            Text(news.author ?? "No author")
                .font(.headline)
        }
    }
}

#Preview {
    NewsListView()
}
