//
//  SearchMovie.swift
//  FenixAssignment
//
//  Created by Q.M.S on 02/04/2022.
//

import Foundation

protocol SearchMovieUseCase {
    func execute(query: String, completion: @escaping ((Result<SearchMovieResultsResponseDTO, Error>) -> Void))
}

class DefaultSearchMovieUseCase: SearchMovieUseCase {
    
    private let repository: SearchMovieRepository = DefaultSearchMovieRepository()
    
    func execute(query: String, completion: @escaping ((Result<SearchMovieResultsResponseDTO, Error>) -> Void)) {
        let apiKey = apiKey
        let requestObject = SearchMovieRequestDTO(apiKey: apiKey, query: query)
        repository.getData(for: requestObject) { response, failure, error in
            guard error == nil else {
                log(error!.localizedDescription)
                completion(.failure(error!))
                return
            }
            guard failure == nil else {
                log(AppError.unexpected.description)
                completion(.failure(AppError.unexpected))
                return
            }
            if let response = response {
                completion(.success(response))
            }
        }
    }
    
}
