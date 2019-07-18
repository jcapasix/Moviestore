//
//  Utils.swift
//  Data
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire

class Utils{
    public static func getDictionary(_ dataResponse:DataResponse<Any>) -> Dictionary<String, AnyObject>{
        return (dataResponse.value as? Dictionary<String, AnyObject>)!
    }
}
