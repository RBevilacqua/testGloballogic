//
//  Services.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import Foundation
import Alamofire

let baseURL: String = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"


class Services {
    
    class func requestJSON(method: HTTPMethod, path: String? = nil, params: [String:Any]? = nil, headers: [String:String]? = nil, callback: @escaping (DataResponse<Any>) -> Void) {
        
        Alamofire.request("\(baseURL)\(path ?? "")", method: method, parameters: params, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response: DataResponse<Any>) in
                callback(response)
        }
        
    }
    
}
