//
//  MovieDetailViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movie: Movie!
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.posterImageView.layer.masksToBounds = true
        self.posterImageView.layer.cornerRadius = 10.0
        
        self.navigationController?.navigationBar.tintColor = .white
        self.title = self.movie.title
        
        if let url = URL(string: "\(IMAGE_LINK_500)\(self.movie.backdrop_path ?? NO_TEXT)"){
            self.backdropImageView.af_setImage(withURL: url)
        }
        
        if let url = URL(string: "\(IMAGE_LINK)\(self.movie.poster_path ?? NO_TEXT)"){
            self.posterImageView.af_setImage(withURL: url)
        }
        
        self.overviewTextView.text = self.movie.overview
        self.titleLabel.text = self.movie.title
        self.releaseDateLabel.text = "Release Date: \(String(describing: self.movie.release_date!))"
    }

}

