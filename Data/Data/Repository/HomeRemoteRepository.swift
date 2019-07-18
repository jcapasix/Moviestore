//
//  HomeRemoteRepository.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public class HomeRemoteRepository: HomeRepositoryProtocol {

    public static let sharedInstance = HomeRemoteRepository()
    
    public func getList(list_id: Int, page: Int, completion: @escaping ([MovieDataEntity]?, NSError?) -> Void) {
        
        var moviesResponse: MoviesResponse?
        var error: NSError?
        
//        let parameters : [ String : Any] = [
//            "api_key" : AppEnvironment.configuration.apiKey,
//            "page" : page
//        ]
        
        let headers = [
            "content-type": "application/json;charset=utf-8",
            "authorization": "Bearer \(AppEnvironment.configuration.accessToken)"
        ]
        
        Connection.sharedInstance.request(Routes.getList.getURL(), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<MoviesResponse>) in
            
            switch response.result {
                
            case .success(_):
                moviesResponse = response.result.value
                completion(moviesResponse?.results, error)
                print("success")
                
            case .failure(let _error):
                completion(nil, _error as NSError)
                print("failure")
            }
            
        }
    }
    
    public func getGenres(completion: @escaping ([GenreDataEntity]?, NSError?) -> Void) {
        
        var genresResponse: GenreResponse?
        var error: NSError?
        
        let headers = [
            "content-type": "application/json;charset=utf-8",
            "authorization": "Bearer \(AppEnvironment.configuration.accessToken)"
        ]
        
        Connection.sharedInstance.request(Routes.getGenres.getURL(), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<GenreResponse>) in
            
            
            switch response.result {

            case .success(_):
                genresResponse = response.result.value
                completion(genresResponse?.genres, error)
                print("success")
                
            case .failure(let _error):
                completion(nil, _error as NSError)
                print("failure")
            }
            
        }
    }
    
}
