//
//  GenreDataEntity.swift
//  Data
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenreDataEntity: Mappable  {
    
    public var id: Int?
    public var name:String?
    
    init(id: Int?, name:String?) {
        self.id = id
        self.name = name
    }
    init(genreEntity: GenreEntity) {
        self.id = Int(genreEntity.id)
        self.name = genreEntity.name
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]

    }
}
