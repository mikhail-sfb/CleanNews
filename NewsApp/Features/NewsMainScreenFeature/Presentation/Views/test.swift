//
//  test.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel(
        fetchUseCase: DependencyContainer.shared.makeFetchNewsUseCase())

    var body: some View {
        Text("Ok")
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
