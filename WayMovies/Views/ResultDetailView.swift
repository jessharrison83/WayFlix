//
//  ResultDetailView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/30/20.
//

import SwiftUI

struct ResultDetailView: View {
    let movie: Movie
    @State private var isSharePresented: Bool = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(movie.media_type ?? Constants.unknownFieldText)
                    .fontWeight(.semibold)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(Constants.smallPadding)
                    .background(Color.pink)
                Text(movie.title ?? movie.name ?? Constants.unknownFieldText)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                if movie.vote_average != nil {
                    StarRatingView(rating: movie.vote_average!)
                }
            }
        }
            .padding(.bottom)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .bottomLeading
            )
            .background(CardImageView(movieImagePath: movie.poster_path ?? nil)
            .edgesIgnoringSafeArea(.all))

        VStack(alignment: .leading) {
            HStack (alignment: .lastTextBaseline){
                Text("Overview")
                    .fontWeight(.bold)
                    .padding(.bottom)
                Spacer()
                Button(action: {self.isSharePresented = true}) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                }
                    .sheet(isPresented: $isSharePresented, onDismiss: {
                    self.isSharePresented = false
                    }, content: {
                    ActivityViewController(activityItems: [URL(string: "\(Constants.tmdbRedirectBaseURL)/\( movie.media_type ?? "movie")/\(movie.id)") as Any] )
                    })
            }
                .frame(height: Constants.stackViewSpacing)
                .padding(.leading, Constants.smallPadding)
                .padding(.trailing, Constants.smallPadding)
            
            Text(movie.overview ?? Constants.unknownFieldText)
        }
            .padding(.top, Constants.stackViewSpacing)
    }
}



