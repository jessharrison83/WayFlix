//
//  StarRatingView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/30/20.
//


import SwiftUI

struct StarRatingView: View {
    let rating: Double

    var body: some View {
        HStack {
            ForEach(1 ..< (Constants.starMax + 1), id: \.self) { i in
                if i <= convertToStars(rating) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
    
    private func convertToStars(_ rating: Double) -> Int {
        let convertedRating = Int(rating / 2)
        return convertedRating >= 1 ? convertedRating : 1
    }
}


