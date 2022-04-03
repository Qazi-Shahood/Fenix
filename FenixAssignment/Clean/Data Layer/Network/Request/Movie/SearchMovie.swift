//
//  SearchMovie.swift
//  FenixAssignment
//
//  Created by Q.M.S on 03/04/2022.
//

import Foundation

class SearchMovie {
    
    private var requestObject: SearchMovieRequestDTO
    
    init(requestObject: SearchMovieRequestDTO) {
        self.requestObject = requestObject
    }
    
}

extension SearchMovie: EndpointProvider {
    typealias Response = SearchMovieResultsResponseDTO
    typealias Body = EmptyDTO
    typealias Failure = EmptyDTO
    typealias Query = SearchMovieRequestDTO
    
    var endpoint: Endpoint<Body, Query> {
        return Endpoint(api: .defaultApi,
                        method: .get,
                        path: EndpointPaths.getMovies.getPath(),
                        query: requestObject)
    }
}
