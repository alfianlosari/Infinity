//
//  FilmViewModel.swift
//  InfinityExamples
//
//  Created by Alfian Losari on 4/4/21.
//

import SwiftUI
import Infinity

class FilmViewModel: ObservableObject {
    
    @Published var films: [Film]?
    @Published var isFetching = false
    @Published var error: Error?
    
    private let url = URL(string: "https://swapi.dev/api/films")!
    
    private let infinity = Infinity()
    
    func fetch() {
        films = []
        error = nil
        isFetching = true
        
        infinity.fetch(url: url) {[weak self] (result: Result<Films, Error>) in
            guard let self = self else { return }
            self.isFetching = false
            
            switch result {
            case let .success(films):
                self.films = films.all
                
            case let .failure(error):
                self.error = error                
            }
        }
        
    }
    
}
