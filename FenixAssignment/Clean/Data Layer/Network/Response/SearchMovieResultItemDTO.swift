//
//  SearchMovieResultItemDTO.swift
//  FenixAssignment
//
//  Created by Q.M.S on 02/04/2022.
//

import Foundation

struct SearchMovieResultItemDTO: DTO {
    
    let originalTitle: String
    let posterPath: String?
    
    public enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
    
}
