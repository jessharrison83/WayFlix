//
//  BrowseMoviesViewModel.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//

import Foundation
import SwiftUI

final class BrowseMoviesViewModel: ObservableObject {
    
    init() {
        loadBrowseMovies()
    }
    
    static let shared = BrowseMoviesViewModel()
    
    @Published var dataIsLoaded: Bool = false
    @Published var upcomingMovies = Movies()
    @Published var topRatedMovies = Movies()
    @Published var nowPlayingMovies = Movies()
    let categories = ["upcoming", "top_rated", "now_playing"]
    
    func loadBrowseMovies() {
        for category in categories {
            WebService.shared.loadBrowseMovies(category) {[weak self] result in
                switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        switch category {
                        case Categories.upcoming.rawValue:
                            self?.upcomingMovies = movies
                        case Categories.topRated.rawValue:
                            self?.topRatedMovies = movies
                        case Categories.nowPlaying.rawValue:
                            self?.nowPlayingMovies = movies
                        default:
                            return
                        }
                        self?.dataIsLoaded = true
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }

    }
}
