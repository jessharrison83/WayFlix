//
//  BrowseMoviesView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/30/20.
//

import SwiftUI

struct BrowseMoviesView: View {
    @ObservedObject var movies: BrowseMoviesViewModel = .shared
    
    var body: some View {
        VStack(alignment: .leading) {
            if movies.dataIsLoaded {
                Text(Constants.upcomingText)
                ScrollView(.horizontal) {
                    HStack(spacing: Constants.stackViewSpacing) {
                        ForEach(movies.upcomingMovies.results, id: \.id) { movie in
                            BrowseCardView(movie: movie)
                        }
                    }
                        .padding()
                }
                Text(Constants.topRatedText)
                ScrollView(.horizontal) {
                    HStack(spacing: Constants.stackViewSpacing) {
                        ForEach(movies.topRatedMovies.results, id: \.id) { movie in
                            BrowseCardView(movie: movie)
                        }
                    }
                        .padding()
                }
                Text(Constants.nowPlayingText)
                ScrollView(.horizontal) {
                    HStack(spacing: Constants.stackViewSpacing) {
                        ForEach(movies.nowPlayingMovies.results, id: \.id) { movie in
                            BrowseCardView(movie: movie)
                        }
                    }
                        .padding()
                }
            } else {
                Text(Constants.loadText)
            }
        }
            
    }
}
