//
//  HomeViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 7/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import Domain
import AlamofireImage

class HomeViewController: UIViewController, HomeViewProtocol {
    

    var presenter: HomePresenterProtocol!
    
    private var genres:[Genre] = []
    private var movies:[Movie] = []
    private var filterMovies:[Movie] = []
    private var filterGenres:[Genre] = []
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categorySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = HomeConfigurator.sharedInstance.configure(self)
        self.initView()
    }
    
    func initView(){
        
        self.presenter.getList(list_id: 1, page: 1)
        self.presenter.getGenres()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        self.categorySearchBar.delegate = self
        
        self.title = "Movies"
    }
    
    func showMovies(movies: [Movie]) {
        self.movies = movies
        self.filterMovies = movies
        self.collectionView.reloadData()
    }
    
    func showGenres(genres: [Genre]) {
        self.genres = genres
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filterMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath as IndexPath) as! MovieCollectionViewCell
        
        if let url = URL(string: "\(IMGE_LINK)\(self.filterMovies[indexPath.row].poster_path ?? NO_TEXT)"){
            cell.posterImageView.af_setImage(withURL: url)
        }
        return cell
    }
}

// MARK: - Collection View Flow Layout Delegate
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension HomeViewController: UISearchBarDelegate{
    
    func printFilterGenres(){
        for genre in filterGenres{
            print("Genre: \(genre.name!)")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let lowerSearchText = searchText.lowercased()
        
        self.filterGenres = searchText.isEmpty ? self.genres : self.genres.filter({ (genre) -> Bool in
            return genre.name!.lowercased().hasPrefix(lowerSearchText)
        })
        
        self.filterMovies = searchText.isEmpty ? self.movies : self.movies.filter { movie -> Bool in
            return movie.genre_ids!.contains(self.filterGenres.first?.id ?? 1)
        }
        
        self.printFilterGenres()
        self.collectionView.reloadData()
        
    }
}
