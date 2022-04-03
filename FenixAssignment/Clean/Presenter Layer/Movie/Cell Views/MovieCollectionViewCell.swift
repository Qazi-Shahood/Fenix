//
//  MovieCollectionViewCell.swift
//  TenTwenty
//
//  Created by Q.M.S on 09/02/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var gradientImageView: UIImageView!
    @IBOutlet private weak var shadeView: UIView!
    
    private var imageUrl: String?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 10
    }
    
    func configure(imageUrl: String, title: String) {
        nameLabel.text = title
        self.imageUrl = imageUrl
        downloadImage()
    }
    
    func downloadImage() {
        guard imageUrl != nil else { return }
        let urlString = posterBaseUrl + imageUrl!
        let url = URL(string: urlString)!
        Network.shared.downloadImage(from: url) { [weak self] image, err in
            guard err == nil else {
                log(err!.localizedDescription)
                return
            }
            if let image = image {
                self?.imageView.image = image
            }
        }
    }

}
