//
//  CardImageViewModel.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/28/20.
//

import Foundation
import SwiftUI

final class CardImageViewModel: ObservableObject {
    @Published var movieImage: Image = Image(Constants.defaultImagePath)
    @Published var imageLoaded: Bool = false
    
    init () { }
    
    func getImage(_ moviePath: String) {
            guard let imageURL = URL(string: "\(Constants.imageBaseURL)/w500\(moviePath)") else {
                return
            }
            URLSession.shared.dataTask(with: imageURL) { data, _, error in
                guard error == nil else {
                    return
                }
                if let data = data {
                    DispatchQueue.main.async { [self] in
                        guard let imageData = UIImage(data: data) else {
                            return
                        }
                        movieImage = Image(uiImage: imageData)
                        imageLoaded = true
                    }
                } else {
                    return
                }
            }.resume()
        }
}
