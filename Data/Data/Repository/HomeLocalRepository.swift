//
//  HomeLocalRepository.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

public class HomeLocalRepository: HomeRepositoryProtocol {
    
    public static let sharedInstance = HomeLocalRepository()
    
    public func getList(list_id: Int, page: Int, completion: @escaping ([MovieDataEntity]?, NSError?) -> Void) {
        
    }
    
    public func getGenres(completion: @escaping ([GenreDataEntity]?, NSError?) -> Void) {
        
    }
}



