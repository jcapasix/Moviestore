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

    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results:[MovieDataEntity]?
    var dates: [String: String]?
    
//    var status:StatusEntity?
//    var error:ErrorResponse?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.page <- map["page"]
        self.total_results <- map["total_results"]
        self.total_pages <- map["total_pages"]
        self.results <- map["results"]
        self.dates <- map["dates"]
    }
}
