//
//  NewsDetailView.swift
//  News-App
//
//  Created by Mehmet Emin Karakaş on 1.10.2023.
//

import SwiftUI

struct NewsDetailView: View {
    let newsItem: NewsItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let imageURL = newsItem.imageURL {
                    AsyncImage(url: imageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else if phase.error != nil {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                    }
                    .frame(height: 200)
                }
                
                Text(newsItem.name)
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(newsItem.description)
                    .font(.body)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
