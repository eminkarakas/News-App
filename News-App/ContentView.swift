//
//  ContentView.swift
//  News-App
//
//  Created by Mehmet Emin Karakaş on 1.10.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newsManager = NewsManager()
    
    var body: some View {
        NavigationView {
            List(newsManager.newsItems) { newsItem in
                NavigationLink(destination: NewsDetailView(newsItem: newsItem)) {
                    HStack {
                        if let imageURL = newsItem.imageURL {
                            AsyncImage(url: imageURL) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                } else {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                        
                        Spacer(minLength: 30)
                        
                        VStack(alignment: .leading) {
                            Text(newsItem.name)
                                .font(.headline)
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("News")
        }
    }
}


#Preview {
    ContentView()
}
