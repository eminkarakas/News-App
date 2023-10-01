//
//  NewsManager.swift
//  News-App
//
//  Created by Mehmet Emin Karakaş on 1.10.2023.
//

import Foundation

class NewsManager: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    
    func fetchData() {
        guard let url = URL(string: "https://api.collectapi.com/news/getNews?country=de&tag=general") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("apikey 4sPEv1K0KsyfXz7oyumObm:2nEPFG4W15CIvXjbCaQAUp", forHTTPHeaderField: "authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.newsItems = result.result
                }
            } catch {
                print("JSON parsing error: \(error)")
            }
        }.resume()
    }
    
    init() {
        fetchData()
    }
}

struct NewsResponse: Decodable {
    let success: Bool
    let result: [NewsItem]

    enum CodingKeys: String, CodingKey {
        case success
        case result
    }
}
