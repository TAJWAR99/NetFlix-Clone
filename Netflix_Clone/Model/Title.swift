//
//  Title.swift
//  Netflix_Clone
//
//  Created by Sihan on 2/12/23.
//

import Foundation

struct TrendingTitles: Decodable {
    let results: [Title]
}

struct Title: Decodable {
    var id: Int
    var name: String?
    var original_language: String?
    var original_title: String?
    var original_name: String?
    var overview: String?
    var poster_path: String?
    var media_type: String?
    var first_air_date: String?
    var vote_average: Double?
    var vote_count: Int
}
