//
//  SearchResultsView.swift
//  WayMovies
//
//  Created by Jessica Berler on 11/30/20.
//

import SwiftUI

struct SearchResultsView: View {
    @ObservedObject var search: SearchMovies = .shared
    @State var loadedResults: Movies
    @State var text: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack {
                    HStack {
                        TextField(Constants.searchBarText,
                                  text: $text,
                                  onCommit: {
                                    search.loadSearchResults(text)
                                  })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: { search.loadSearchResults(text) }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                        .padding()
                    ForEach(search.searchResults.results, id: \.id) { result in
                        SearchResultCard(searchResult: result)
                    }
                        .padding()
                }
            }
        }
    }
}
