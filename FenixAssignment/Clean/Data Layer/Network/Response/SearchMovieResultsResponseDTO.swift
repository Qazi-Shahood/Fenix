//
//  SearchMovieResultsResponseDTO.swift
//  FenixAssignment
//
//  Created by Q.M.S on 02/04/2022.
//

import Foundation

struct SearchMovieResultsResponseDTO: DTO {
    let page: Int
    let results: [SearchMovieResultItemDTO]
    let totalPages: Int
    let totalResults: Int
    
    public enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page, results
    }
}
