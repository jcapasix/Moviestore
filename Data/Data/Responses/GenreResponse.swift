//
//  GenreResponse.swift
//  Data
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenreResponse: Mappable  {
    
    public var genres:[GenreDataEntity]?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.genres <- map["genres"]
    }
}
