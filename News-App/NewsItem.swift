//
//  NewsItem.swift
//  News-App
//
//  Created by Mehmet Emin Karakaş on 1.10.2023.
//

import Foundation

struct NewsItem: Identifiable, Decodable {
    let id: String
    let url: URL
    let description: String
    let imageURL: URL?
    let name: String
    let source: String

    enum CodingKeys: String, CodingKey {
        case id = "key" 
        case url
        case description
        case imageURL = "image"
        case name
        case source
    }
}
