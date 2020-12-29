//
//  Config.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/8/20.
//
import Foundation
import SwiftUI

enum Categories: String {
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming
}

enum MediaType: String {
    case movie
    case tvShow = "tv"
    case person
}

enum Constants {
    static let logoSpacing: CGFloat = 60
    static let stackViewSpacing: CGFloat = 30
    static let tmdbRedirectBaseURL: String = "https://www.themoviedb.org"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p"
    static let movieBaseURL: String = "https://api.themoviedb.org/3/movie"
    static let multiSearchBaseURL: String = "https://api.themoviedb.org/3/search/multi"
    static let api: String = "71ab1b19293efe581c569c1c79d0f004"
    static let starMax: Int = 5
    static let topRatedText: String = "Top Rated Movies"
    static let upcomingText: String = "Upcoming Movies"
    static let nowPlayingText: String = "Now Playing"
    static let loadText: String = "Loading..."
    static let defaultImagePath: String = "tmdbLogo"
    static let browseCardMinWidth: CGFloat = 120
    static let browseCardMaxWidth: CGFloat = 160
    static let browseCardMinHeight: CGFloat = 120
    static let browseCardMaxHeight: CGFloat = 200
    static let unknownFieldText: String = "Unknown"
    static let browseDetailLabelText: String = "Movie"
    static let searchBarText: String = "Search Movies, Actors, and TV Shows"
    static let imageCornerRadius: CGFloat = 5.0
    static let smallPadding: CGFloat = 3
    static let homeBrowseText: String = "I just want to browse"
    static let index: Int = Int.random(in: 0...5)
}

