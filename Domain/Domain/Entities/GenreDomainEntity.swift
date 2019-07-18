//
//  GenreDomainEntity.swift
//  Domain
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper
import Data

public class GenreDomainEntity: Mappable  {
    
    public var id:Int?
    public var name:String?
    
    init(id:Int?, name:String?) {
        self.id = id
        self.name = name
    }
    
    init(genreDataEntity: GenreDataEntity) {
        self.id = genreDataEntity.id
        self.name = genreDataEntity.name
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
    }
    
    static func transform(genreDataEntities:[GenreDataEntity]?) -> [GenreDomainEntity]?{
        var genreList:[GenreDomainEntity] = []
        if genreDataEntities != nil{
            for genreDataEntity in genreDataEntities!{
                genreList.append(GenreDomainEntity(genreDataEntity: genreDataEntity))
            }
        }
        return genreList
    }
}
