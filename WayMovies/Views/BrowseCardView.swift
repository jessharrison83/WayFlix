//
//  BrowseCardView.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//

import SwiftUI

struct BrowseCardView: View {
    let movie: Movie
    var body: some View {
        NavigationLink(destination: ResultDetailView(movie: movie)) {
            VStack {
                CardImageView(movieImagePath: (movie.poster_path ?? movie.profile_path) ?? nil)
                Text((movie.title ?? movie.name) ?? Constants.unknownFieldText)
                    .lineLimit(1)
                if let stars = movie.vote_average {
                    StarRatingView(rating: stars)
                }
            }
                .frame(minWidth: Constants.browseCardMinWidth, maxWidth: Constants.browseCardMaxWidth, minHeight: Constants.browseCardMinHeight, maxHeight: Constants.browseCardMaxHeight)
        }
            .foregroundColor(.black)
    }
}

