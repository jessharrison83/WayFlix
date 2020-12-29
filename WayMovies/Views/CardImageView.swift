//
//  CardImageView.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//

import SwiftUI

struct CardImageView: View {
    @ObservedObject var getImages = CardImageViewModel()
    var movieImagePath: String?
    var body: some View {
        if getImages.imageLoaded {
            getImages.movieImage
                .resizable()
                .cornerRadius(Constants.imageCornerRadius)
        } else {
            VStack {
                Text(Constants.loadText)
            }
                .onAppear(perform: { getImages.getImage(movieImagePath ?? Constants.defaultImagePath) })
        }
    }
}
