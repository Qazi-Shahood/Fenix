//
//  SearchMovieRepository.swift
//  FenixAssignment
//
//  Created by Q.M.S on 03/04/2022.
//

typealias SearchMovieRepositoryCompletion = ((SearchMovie.Response?, SearchMovie.Failure?, Error?) -> Void)

protocol SearchMovieRepository {
    func getData(for search: SearchMovieRequestDTO, completion: @escaping SearchMovieRepositoryCompletion)
}
