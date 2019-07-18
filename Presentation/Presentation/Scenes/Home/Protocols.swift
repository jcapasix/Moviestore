//
//  Protocols.swift
//  Presentation
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//
import Domain

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol! { get set }
    func showGenres(genres:[Genre])
    func showMovies(movies:[Movie])
}

protocol HomeRouterProtocol {
    func routeToDetailMovie()
}

protocol HomePresenterProtocol: class {
    var router: HomeRouterProtocol { get }
    //var interactor: HomeIn { get }
    func getGenres()
    func getList(list_id: Int, page: Int)
    func goToDetailMovie()
}

protocol HomeConfiguratorProtocol {
    func configure(_ view: HomeViewProtocol)
}
