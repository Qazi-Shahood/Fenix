//
//  MovieSearchViewModel.swift
//  FenixAssignment
//
//  Created by Q.M.S on 01/04/2022.
//

import Foundation

class MovieSearchViewModel {
    
    private(set) var moviesList: SearchMovieResultsResponseDTO?
    
    private let movieSearchUseCase: SearchMovieUseCase = DefaultSearchMovieUseCase()
    
    weak var delegate: MovieSearchViewModelDelegate?
    
    func getSearchResult(for text: String) {
        movieSearchUseCase.execute(query: text) { [weak self] result in
            switch result {
            case .success(let response):
                self?.moviesList = response
                self?.delegate?.reloadData()
            case .failure(let err):
                log("Error while fetching: \(err.localizedDescription)")
            }
        }
    }
    
    func clearData() {
        moviesList = nil
        delegate?.reloadData()
    }
    
}
