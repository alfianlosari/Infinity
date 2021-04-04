//
//  ContentView.swift
//  InfinityExamples
//
//  Created by Alfian Losari on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FilmViewModel()
    
    var body: some View {
        NavigationView {
            if let films = viewModel.films {
                List(films ) {
                    Text($0.title)
                }
            } else if let error = viewModel.error {
                Text(error.localizedDescription)
            } else {
                ProgressView("Fetching...")
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
