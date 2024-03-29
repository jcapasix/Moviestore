//
//  MovieDataEntity.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieDataEntity: Mappable  {
    
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
    
    init(vote_average:Float?, vote_count:Int?, id:Int?, video:Bool?, media_type:String?, title:String?, popularity:Float?, poster_path:String?, original_language: String?, original_title:String?, genre_ids:[Int]?, backdrop_path: String?, adult:Bool?, overview:String?, release_date:String?) {
        self.vote_average = vote_average
        self.vote_count = vote_count
        self.id = id
        self.video = video
        self.media_type = media_type
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_language = original_language
        self.original_title = original_title
        self.genre_ids = genre_ids
        self.backdrop_path = backdrop_path
        self.adult = adult
        self.overview = overview
        self.release_date = release_date
    }
    
    init(movieEntity: MovieEntity) {
        self.vote_average = movieEntity.vote_average
        self.vote_count = Int(movieEntity.vote_count)
        self.id = Int(movieEntity.id)
        self.video = movieEntity.video
        self.media_type = movieEntity.media_type
        self.title = movieEntity.title
        self.popularity = movieEntity.popularity
        self.poster_path = movieEntity.poster_path
        self.original_language = movieEntity.original_language
        self.original_title = movieEntity.original_title
        self.genre_ids = movieEntity.genre_ids
        self.backdrop_path = movieEntity.backdrop_path
        self.adult = movieEntity.adult
        self.overview = movieEntity.overview
        self.release_date = movieEntity.release_date
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.vote_average <- map["vote_average"]
        self.vote_count <- map["vote_count"]
        self.id <- map["id"]
        self.video <- map["video"]
        self.media_type <- map["media_type"]
        self.title <- map["title"]
        self.popularity <- map["popularity"]
        self.poster_path <- map["poster_path"]
        self.original_language <- map["original_language"]
        self.original_title <- map["original_title"]
        self.genre_ids <- map["genre_ids"]
        self.backdrop_path <- map["backdrop_path"]
        self.adult <- map["adult"]
        self.overview <- map["overview"]
        self.release_date <- map["release_date"]
    }
    
//    static func transform(meetingEntities:[MeetingEntity]?) -> [Meeting]?{
//        var meetingList:[Meeting] = []
//        if meetingEntities != nil{
//            for meetingEntity in meetingEntities!{
//                meetingList.append(meetingEntity.toMeeting())
//            }
//        }
//        return meetingList
//    }
//    
//    func toMeeting() -> Meeting{
//        return Meeting(id: self.id, phone: self.phone, room: self.room, pin: self.pin, title: self.title)
//    }
}


