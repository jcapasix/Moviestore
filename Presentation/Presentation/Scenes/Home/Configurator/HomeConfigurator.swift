//
//  HomeConfigurator.swift
//  Presentation
//
//  Created by Jordan Capa on 7/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Domain
import Data

class HomeConfigurator: HomeConfiguratorProtocol {
    
    public static let sharedInstance = HomeConfigurator()
    
    func configure(_ view: HomeViewProtocol) {
        
        let interactor = HomeInteractor(repository: HomeRemoteRepository.sharedInstance)
        let router = HomeRouter(view: view)
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
    }
}
