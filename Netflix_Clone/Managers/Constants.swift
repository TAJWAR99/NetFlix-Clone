//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Sihan on 25/11/23.
//

import Foundation


struct Constants {
    static let API_KEY = "9c783c6402849a444a7700e34bab3ced"
    
    static func getAPIUrl(type: String) -> String{
        var API_URL = "https://api.themoviedb.org/3/trending/\(type)/day?api_key=\(Constants.API_KEY)"
        return API_URL
    }
    //static let API_URL = "https://api.themoviedb.org/3/trending/movies/day?api_key=\(Constants.API_KEY)"
}

