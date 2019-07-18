//
//  Movie.swift
//  Presentation
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Domain

class Movie{
    
    public var vote_average:Float?
    public var vote_count:Int?
    public var id:Int?
    public var video:Bool?
    public var media_type:String?
    public var title:String?
    public var popularity:Float?
    public var poster_path:String?
    public var original_language: String?
    public var original_title:String?
    public var genre_ids:[Int]?
    public var backdrop_path: String?
    public var adult:Bool?
    public var overview:String?
    public var release_date:String?
    
    init(movieDomainEntity: MovieDomainEntity) {
        self.vote_average = movieDomainEntity.vote_average
        self.vote_count = movieDomainEntity.vote_count
        self.id = movieDomainEntity.id
        self.video = movieDomainEntity.video
        self.media_type = movieDomainEntity.media_type
        self.title = movieDomainEntity.title
        self.popularity = movieDomainEntity.popularity
        self.poster_path = movieDomainEntity.poster_path
        self.original_language = movieDomainEntity.original_language
        self.original_title = movieDomainEntity.original_title
        self.genre_ids = movieDomainEntity.genre_ids
        self.backdrop_path = movieDomainEntity.backdrop_path
        self.adult = movieDomainEntity.adult
        self.overview = movieDomainEntity.overview
        self.release_date = movieDomainEntity.release_date
    }
    
    
    static func transform(movieDomainEntities:[MovieDomainEntity]?) -> [Movie]?{
        var movieList:[Movie] = []
        if movieDomainEntities != nil{
            for movieDomainEntity in movieDomainEntities!{
                movieList.append(Movie(movieDomainEntity: movieDomainEntity))
            }
        }
        return movieList
    }

    
}
