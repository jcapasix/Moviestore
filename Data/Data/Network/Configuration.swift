//
//  Configuration.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire

enum Enviroment: String{
    case PROD
    case DEV
}

public protocol Configuration {
    static var serverURL: String { get }
    static var apiKey: String { get }
    static var accessToken: String { get }
    static var environment: String { get }
}

public struct ProductionConfig: Configuration {
    public static let serverURL         = "https://api.themoviedb.org/3"
    public static let apiKey            = "d3a6d72084969948e3a31970e4ee49b6"
    public static let accessToken       = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkM2E2ZDcyMDg0OTY5OTQ4ZTNhMzE5NzBlNGVlNDliNiIsInN1YiI6IjVkMmU5NzA0Y2FhYjZkNWQ5ODk2NGY2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0w6fN-txklmeLc3wOcRwrDIHBRzok6kDxnChX2UOE6s"
    public static let environment       = Enviroment.PROD.rawValue
}

public struct DevelopConfig: Configuration {
    public static let serverURL         = "https://api.themoviedb.org/4"
    public static let apiKey            = "d3a6d72084969948e3a31970e4ee49b6"
    public static let accessToken       = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkM2E2ZDcyMDg0OTY5OTQ4ZTNhMzE5NzBlNGVlNDliNiIsInN1YiI6IjVkMmU5NzA0Y2FhYjZkNWQ5ODk2NGY2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0w6fN-txklmeLc3wOcRwrDIHBRzok6kDxnChX2UOE6s"
    public static let environment       = Enviroment.DEV.rawValue
}

class AppEnvironment{
    
    static var configuration: Configuration.Type{
        #if DEVELOPMENT
        return DevelopConfig.self
        #else
        return ProductionConfig.self
        #endif
    }
    //static var headers:Headers?
}
