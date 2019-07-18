//
//  HomeRouter.swift
//  Presentation
//
//  Created by Jordan Capa on 7/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    
    fileprivate weak var view: HomeViewController?
    
    init(view: HomeViewProtocol) {
        self.view = view as? HomeViewController
    }
    
    func routeToDetailMovie(){
        
    }
}
