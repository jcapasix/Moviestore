//
//  Genre.swift
//  Presentation
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper
import Domain


public class Genre {
    
    public var id: Int?
    public var name:String?
    
    init(id: Int?, name:String?) {
        self.id = id
        self.name = name
    }
    
    init(genreDomainEntity:GenreDomainEntity) {
        self.id = genreDomainEntity.id
        self.name = genreDomainEntity.name
    }
    
    static func transform(genreDomainEntities:[GenreDomainEntity]?) -> [Genre]?{
        var genreList:[Genre] = []
        if genreDomainEntities != nil{
            for genreDomainEntity in genreDomainEntities!{
                genreList.append(Genre(genreDomainEntity: genreDomainEntity))
            }
        }
        return genreList
    }

}
