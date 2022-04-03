//
//  SearchMovieRequestDTO.swift
//  FenixAssignment
//
//  Created by Q.M.S on 02/04/2022.
//

struct SearchMovieRequestDTO: DTO {
    
    let apiKey: String
    let query: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case query
    }
    
}
