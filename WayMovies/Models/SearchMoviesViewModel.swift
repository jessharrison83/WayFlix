//
//  SearchMoviesViewModel.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/15/20.
//

import SwiftUI
import Foundation

final class SearchMoviesViewModel: ObservableObject {
    
    private init() { }
    
    static let shared = SearchMoviesViewModel()
    
    @Published var dataIsLoaded: Bool = false
    @Published var searchResults: Movies = Movies()
    @Published var query: String = ""
    
    func loadSearchResults(_ search: String) {
        WebService.shared.loadSearchResults(search) {[weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async{
                    self?.dataIsLoaded = true
                    self?.searchResults = movies
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

