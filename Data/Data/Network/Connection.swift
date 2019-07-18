//
//  Connection.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire
import Mocker

class Connection: SessionManager {
    
    public static let sharedInstance = Connection()
    
    //var alamofireManager : Alamofire.SessionManager?
    let configuration = URLSessionConfiguration.default
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {
        super.init()
        self.configuration.timeoutIntervalForResource = 5
        //self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
}


class MockConnection: SessionManager{
    
    public static let sharedInstance = MockConnection()
    
    let configuration = URLSessionConfiguration.default
    
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {
        self.configuration.protocolClasses = [MockingURLProtocol.self]
        self.configuration.timeoutIntervalForResource = 5
        super.init(configuration: configuration)
    }
}
