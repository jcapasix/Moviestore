//
//  HomePresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 7/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Domain
import SVProgressHUD

class LoginPresenter{
    
    fileprivate weak var view: HomeViewProtocol?
    internal let router: HomeRouterProtocol
    internal let interactor: HomeInteractor
    
    init(view: HomeViewProtocol, router: HomeRouterProtocol, interactor: HomeInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension LoginPresenter: HomePresenterProtocol{
    
    func getGenres(){
        self.interactor.getGenres { (genres, error) in
            self.view?.showGenres(genres: Genre.transform(genreDomainEntities: genres)!)
        }
    }
    
    func getList(list_id: Int, page: Int) {
        SVProgressHUD.show()
        self.interactor.getList(list_id: list_id, page: page) { (movies, error) in
            SVProgressHUD.dismiss()
            self.view?.showMovies(movies: Movie.transform(movieDomainEntities: movies)!)
        }
    }
    
    func goToDetailMovie(movie: Movie) {
        self.router.routeToDetailMovie(movie: movie)
    }
    
    func goToCategories(genres: [Genre]) {
        self.router.routeToCategories(genres: genres)
    }
}
