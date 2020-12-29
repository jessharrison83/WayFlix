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
                            Image(Constants.defaultImagePath)
                                .resizable()
                                .foregroundColor(.white)
                                .frame(minWidth: Constants.browseCardMinWidth, maxWidth: Constants.browseCardMaxWidth, minHeight: Constants.browseCardMinHeight, maxHeight: 160)
                                .aspectRatio(contentMode: .fill)
                                .padding(Constants.stackViewSpacing)
                                
                            Text(Constants.searchBarText)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(.title)
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
                                    .font(.callout)
                            }
                            ZStack {
                            NavigationLink("next page", destination: SearchResultsView(loadedResults: search.searchResults), isActive: self.$search.dataIsLoaded)
                            }
                                .hidden()
                            Spacer()
                            Spacer()
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
