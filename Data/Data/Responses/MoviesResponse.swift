//
//  MoviesResponse.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class MoviesResponse: Mappable  {
    
    var iso_639_1: String?
    var id: Int?
    var page: Int?
    var iso_3166_1: String?
    var total_results: Int?
    var object_ids: [String: String]?
    var revenue: Int?
    var total_pages: Int?
    var name: String?
    var isPublic: String?
    var comments: [String: String]?
    var sort_by: String?
    var description: String?
    var backdrop_path: String?
    var results:[MovieDataEntity]?
    var average_rating: Int?
    var runtime: Int?
    var poster_path: String?
    
//    var status:StatusEntity?
//    var error:ErrorResponse?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.iso_639_1 <- map["iso_639_1"]
        self.id <- map["id"]
        self.page <- map["page"]
        self.iso_3166_1 <- map["iso_3166_1"]
        self.total_results <- map["total_results"]
        self.object_ids <- map["object_ids"]
        self.revenue <- map["revenue"]
        self.total_pages <- map["total_pages"]
        self.name <- map["name"]
        self.isPublic <- map["public"]
        self.comments <- map["comments"]
        self.sort_by <- map["sort_by"]
        self.description <- map["description"]
        self.backdrop_path <- map["backdrop_path"]
        self.results <- map["results"]
        self.average_rating <- map["average_rating"]
        self.runtime <- map["runtime"]
        self.poster_path <- map["poster_path"]
    }
}
