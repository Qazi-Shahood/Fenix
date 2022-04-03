//
//  MovieSearchViewController.swift
//  FenixAssignment
//
//  Created by Q.M.S on 01/04/2022.
//

import Foundation
import UIKit

class MovieSearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: MovieSearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        searchBar.delegate = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
    
    public class func instantiate() -> MovieSearchViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieSearchViewController") as! MovieSearchViewController
        return vc
    }
    
}

// MARK: - CollectionView Delegates
extension MovieSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.moviesList?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let title = viewModel.moviesList?.results[indexPath.item].originalTitle ?? ""
        let urlString = viewModel.moviesList?.results[indexPath.item].posterPath ?? ""
        cell.configure(imageUrl: urlString, title: title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 40
        return CGSize(width: screenSize.width - spacing, height: screenSize.height * 0.2)
    }
    
}

// MARK: - ViewModel Delagates
extension MovieSearchViewController: MovieSearchViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
    
}

// MARK: - SearchBar Delegates
extension MovieSearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            viewModel.getSearchResult(for: searchText)
        } else {
            viewModel.clearData()
        }
    }
    
}
