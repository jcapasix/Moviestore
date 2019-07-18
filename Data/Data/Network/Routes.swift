//
//  Routes.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

enum Routes{
    
    case getList
    case getGenres
    
    func getURL() -> String{
        
        let serverHost = AppEnvironment.configuration.serverURL
        
        switch self {
        case .getList:
            return serverHost + "/movie/now_playing?api_key=d3a6d72084969948e3a31970e4ee49b6&page=1"
            
        case .getGenres:
            return serverHost + "/genre/movie/list?api_key=d3a6d72084969948e3a31970e4ee49b6&language=en-US"
        }
    }
}

