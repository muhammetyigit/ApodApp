//
//  ApodModel.swift
//  Apod
//
//  Created by Muhammet Yiğit on 11.03.2025.
//

import Foundation

struct ApodModel: Decodable {
    var title: String
    var description: String
    var url: URL
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "explanation"
        case url = "url"
        case date = "date"
    }
}
