//
//  ResultDetailView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/30/20.
//

import SwiftUI

struct ResultDetailView: View {
    let movie: Movie
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(movie.media_type ?? Constants.unknownFieldText)
                    .fontWeight(.semibold)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(Constants.labelPadding)
                    .background(Color.pink)
                Text(movie.title ?? movie.name ?? Constants.unknownFieldText)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                if movie.vote_average != nil {
                    StarRatingView(rating: movie.vote_average!)
                }
            }
        }.padding(.bottom)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .bottomLeading
            )
            .background(CardImageView(movieImagePath: movie.poster_path ?? nil).edgesIgnoringSafeArea(.all))

        VStack(alignment: .leading) {
            Text("Overview")
                .fontWeight(.bold)
                .padding(.bottom)
            Text(movie.overview ?? Constants.unknownFieldText)

        }
            .padding(.top, 25)
    }
}
