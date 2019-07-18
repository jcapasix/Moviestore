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
    
    private var filterMovies:[Movie] = [Movie]()  {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    private var filterGenres:[Genre] = []
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categorySearchBar: UISearchBar!
    @IBOutlet weak var menuBarView: MenuTabsView!
    
    var currentIndex: Int = 0
    var tabs = ["Movies", "Popular","Top Rated","Upcoming"]
    
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
        
        
        menuBarView.dataArray = tabs
        menuBarView.isSizeToFitCellsNeeded = true
        menuBarView.collView.backgroundColor = UIColor.init(white: 0.97, alpha: 0.97)
        menuBarView.menuDelegate = self
        menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        
        self.title = TITLE_HOME
        self.navigationController?.navigationBar.isTranslucent =  false
        self.navigationController?.navigationBar.barTintColor = UIColor.colorFromHex(APP_COLOR)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.tintColor = .white

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(self.showCategoriesButtonPressed))

    }
    
    func showMovies(movies: [Movie]) {
        self.movies = movies
        self.filterMovies = movies
    }
    
    func showGenres(genres: [Genre]) {
        self.genres = genres
    }
    
    @objc func showCategoriesButtonPressed(){
        print("addButtonPressed")
        self.presenter.goToCategories(genres: self.genres)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.goToDetailMovie(movie: self.filterMovies[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filterMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath as IndexPath) as! MovieCollectionViewCell
        
        if let url = URL(string: "\(IMAGE_LINK)\(self.filterMovies[indexPath.row].poster_path ?? NO_TEXT)"){
            cell.posterImageView.af_setImage(withURL: url)
        }
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController : UICollectionViewDelegateFlowLayout {

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

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let lowerSearchText = searchText.lowercased()
        
        self.filterMovies = searchText.isEmpty ? self.movies : self.movies.filter { movie -> Bool in
            return movie.title!.lowercased().hasPrefix(lowerSearchText)
        }
    }
}

// MARK: - MenuBarDelegate

extension HomeViewController: MenuBarDelegate {
    
    func menuBarDidSelectItemAt(menu: MenuTabsView, index: Int) {
        
        self.categorySearchBar.text = nil
        
        switch index {
        case 1:
            self.filterMovies = self.movies.sorted(by: { CGFloat($0.popularity!) > CGFloat($1.popularity!)})
            break
        case 2:
            self.filterMovies = self.movies.sorted(by: { CGFloat($0.vote_count!) > CGFloat($1.vote_count!)})
            break
        case 3:
            self.filterMovies = self.movies.filter({ (movie) -> Bool in
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: movie.release_date!)
                return currentDate < date!
            })
            break
        default:
            self.filterMovies = self.movies
            break
        }
    }
    
}

extension HomeViewController: CategoriesViewControllerDelegate{
    
    func categoryDidSelectItemAt(index: Int) {
        
        switch index {
        case 0:
            self.filterMovies = self.movies
        default:
            let genreId = self.genres[index - 1].id
            
            self.filterMovies = self.movies.filter { movie -> Bool in
                return movie.genre_ids!.contains(genreId!)
            }

        }
        
    }
}
