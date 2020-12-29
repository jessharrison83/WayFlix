//
//  WebService.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//


import Foundation


class WebService {
    static let shared = WebService()
    
    func loadSearchResults(_ search: String, completion: @escaping (Result<Movies, Error>) -> Void) {

        let query = search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let searchSession = URLSession.shared
        guard let url = URL(string: "\(Constants.multiSearchBaseURL)?api_key=\(Constants.api)&query=\(query ?? search)") else {
            return
        }
        searchSession.dataTask(with: url) {
            data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse, (200 ..< 300).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                fatalError()
            }
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(Movies.self, from: data) else {
                return
            }
            completion(.success(response))
        }.resume()
    }
    
    func loadBrowseMovies(_ type: String, completion: @escaping (Result<Movies, Error>) -> Void) {
        
        let movieSession = URLSession.shared
            guard let url = URL(string: "\(Constants.movieBaseURL)/\(type)?api_key=\(Constants.api)") else {
                return
            }
            movieSession.dataTask(with: url) {
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200 ..< 300).contains(httpResponse.statusCode) else {
                    return
                }
                guard let data = data else {
                    fatalError()
                }
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(Movies.self, from: data) else {
                    return
                }
                completion(.success(response))
            }.resume()
        
    }
}

