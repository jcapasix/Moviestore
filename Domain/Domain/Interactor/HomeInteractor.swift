//
//  HomeInteractor.swift
//  Domain
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Data

public class HomeInteractor: Interactor {
    
    public func getList(list_id:Int, page:Int, completion: @escaping([MovieDomainEntity]?, NSError?) -> Void){
        
        (self.repository as! HomeRepositoryProtocol).getList(list_id: list_id, page: page) { ( movies, error) in
            completion(MovieDomainEntity.transform(movieDataEntities: movies), error)
        }
    }
    
    public func getGenres(completion: @escaping([GenreDomainEntity]?, NSError?) -> Void){
        
        (self.repository as! HomeRepositoryProtocol).getGenres { (genres, error) in
            completion(GenreDomainEntity.transform(genreDataEntities: genres), error)
        }
    }
}
