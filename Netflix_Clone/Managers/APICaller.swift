////
////  APICaller.swift
////  Netflix_Clone
////
////  Created by Sihan on 30/11/23.
////
//
//import Foundation
//
//enum APIError: Error {
//    case failedTogetData
//}
//
//class APICaller {
//    static let shared = APICaller()
//
//    func getTrendingMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
//        guard let url = URL(string: Constants.getAPIUrl(type: "movie")) else { return }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                //                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                //                print(response)
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(TrendingMovieResponse.self, from: data)
//                //                print(response.results[0])
//                completion(.success(response.results))
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//
//        }
//        dataTask.resume()
//    }
//
//    func getTrendingTVs(completion: @escaping(Result<[Tv], Error>) -> Void) {
//        guard let url = URL(string: Constants.getAPIUrl(type: "tv")) else { return }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            do {
////                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
////                print(response)
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(TrendingTvResponse.self, from: data)
////                print(response.results[0])
//                completion(.success(response.results))
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//
//        }
//        dataTask.resume()
//    }
//
//    func getUpcomingMovies(completion: @escaping(Result<[Upcoming], Error>) -> Void){
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(UpcomingMovies.self, from: data)
//                completion(.success(response.results))
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//        }
//        dataTask.resume()
//    }
//
//    func getPopularMovies(completion: @escaping(Result<[Popular], Error>) -> Void){
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.API_KEY)") else { return }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(PopularMovies.self, from: data)
//                completion(.success(response.results))
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//        }
//        dataTask.resume()
//    }
//
//    func getTopRatedMovies(completion: @escaping(Result<[TopRated], Error>) -> Void){
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(TopRatedMovies.self, from: data)
//                completion(.success(response.results))
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//        }
//        dataTask.resume()
//    }
//}
//
//
////"results": [
////    {
////        "adult": false,
////        "backdrop_path": "/vcFW09U4834DyFOeRZpsx9x1D3S.jpg",
////        "id": 57243,
////        "name": "Doctor Who",
////        "original_language": "en",
////        "original_name": "Doctor Who",
////        "overview": "The Doctor is a Time Lord: a 900 year old alien with 2 hearts, part of a gifted civilization who mastered time travel.",
////        "poster_path": "/8n8bF1hPICIYC4byBj0pqNn9vXs.jpg",
////        "media_type": "tv",
////        "genre_ids": [
////            10759,
////            18,
////            10765
////        ],
////        "popularity": 703.406,
////        "first_air_date": "2005-03-26",
////        "vote_average": 7.5,
////        "vote_count": 2693,
////        "origin_country": [
////            "GB"
////        ]
////    }
////]
