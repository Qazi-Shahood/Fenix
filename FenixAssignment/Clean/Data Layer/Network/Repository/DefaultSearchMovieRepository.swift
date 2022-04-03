//
//  SearchMovieRepository.swift
//  FenixAssignment
//
//  Created by Q.M.S on 03/04/2022.
//

import Foundation

class DefaultSearchMovieRepository: SearchMovieRepository {
    
    func getData(for search: SearchMovieRequestDTO, completion: @escaping SearchMovieRepositoryCompletion) {
        let request = SearchMovie(requestObject: search)
        Network.shared.request(request) { result in
            switch result {
            case .success(let response):
                completion(response, nil, nil)
            case .failure(let failure):
                completion(nil, failure, nil)
            case .error(let err):
                completion(nil, nil, err)
            }
        }
    }
    
}
