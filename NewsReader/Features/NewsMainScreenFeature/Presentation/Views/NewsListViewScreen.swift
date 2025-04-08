//
//  NewsListViewScreen.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

struct NewsListViewScreen: View {
    @ObservedObject var newsListViewModel: NewsViewModel
    
    var body: some View {
        VStack {
            Group {
                if newsListViewModel.isLoading {
                    LoadingView(title: "Loading news...")
                } else {
                    List {
                        ForEach(newsListViewModel.news) { news in
                            NewsRowView(news: news)
                                .padding(.vertical, 8)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Tech News")
        }
        .alert("Loading Error", isPresented: $newsListViewModel.showingErrorAlert) {
            Button("Retry") {
                Task {
                    await loadNews()
                }
            }
        } message: {
            Text(
                "Failed to load news articles 😔"
            )
        }
        .task {
            await loadNews()
        }
    }

    private func loadNews() async {
        if newsListViewModel.news.isEmpty {
            await newsListViewModel.fetchNews(newsTopic: "Apple")
        }
    }
}

