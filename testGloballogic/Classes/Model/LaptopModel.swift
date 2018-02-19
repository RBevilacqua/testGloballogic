//
//  LaptopModel.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import UIKit

class LaptopModel: NSObject, Codable {
    var title: String?
    var descrip: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descrip = "description"
        case image = "image"
    }
    
    class func getLaptop(callback: @escaping (_ data: [LaptopModel]?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        
        Services.requestJSON(method: .get) { (data) in
            
            if data.error != nil {
                callback(nil, data.response, data.error)
                
            } else {
                do {
                    
                    //Decode retrived data with JSONDecoder and assing type of Article object
                    let dataCoder = try JSONDecoder().decode([LaptopModel].self, from: data.data!)
                    
                    //Get back to the main queue
                    DispatchQueue.main.async {
                        print(dataCoder)
                        
                        callback(dataCoder, data.response, nil)
                    }
                    
                } catch let jsonError {
                    print(jsonError)
                }
                
            }
        }
        
    }
}
