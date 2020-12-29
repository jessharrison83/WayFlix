//
//  SearchResultCardView.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//

import SwiftUI

struct SearchResultCard: View {
    let searchResult: Movie
    var body: some View {
        NavigationLink(destination: ResultDetailView(movie: searchResult)) {
            VStack {
                Text(searchResult.media_type ?? Constants.unknownFieldText)
                    .fontWeight(.semibold)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.pink)
                Text((searchResult.title ?? searchResult.name) ?? Constants.unknownFieldText)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                if let stars = searchResult.vote_average {
                    StarRatingView(rating: stars)
                }
            }
                .padding(30)
                .background(CardImageView(movieImagePath: searchResult.poster_path ?? nil))
                .frame(minWidth: Constants.browseCardMinWidth, maxWidth: Constants.browseCardMaxWidth, minHeight: Constants.browseCardMinHeight, maxHeight: Constants.browseCardMaxHeight)
        }
    }
}

