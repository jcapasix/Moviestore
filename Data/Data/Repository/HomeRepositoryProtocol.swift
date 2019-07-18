//
//  HomeRepositoryProtocol.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

public protocol HomeRepositoryProtocol{
    
    func getList(list_id:Int, page:Int, completion: @escaping([MovieDataEntity]?, NSError?) -> Void)
    func getGenres(completion: @escaping ([GenreDataEntity]?, NSError?) -> Void)
}
