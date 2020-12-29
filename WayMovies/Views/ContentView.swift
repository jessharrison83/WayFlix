//
//  ContentView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/24/20.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    @ObservedObject var search: SearchMoviesViewModel = .shared
    @ObservedObject var browse: BrowseMoviesViewModel = .shared
    
    
    
    var body: some View {
            NavigationView {
                if browse.upcomingLoaded {
                    ZStack {
                        CardImageView(movieImagePath: browse.upcomingMovies.results[Constants.index].poster_path)
                                .ignoresSafeArea()
                        VStack {
                            Image(systemName: "film")
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fill)
                            HStack {
                                TextField(Constants.searchBarText,
                                text: $text,
                                onCommit: { search.loadSearchResults(text) })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: { search.loadSearchResults(text) }) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            .padding()
                            NavigationLink(destination: BrowseMoviesView()) {
                                Text(Constants.homeBrowseText)
                                    .foregroundColor(.white)
                            }
                            ZStack {
                            NavigationLink("next page", destination: SearchResultsView(loadedResults: search.searchResults), isActive: self.$search.dataIsLoaded)
                            }
                                .hidden()
                        }
                    }
                } else {
                    Text(Constants.loadText)
                }
            }
                .navigationViewStyle(StackNavigationViewStyle())
                .accentColor(.black)
    }
}
