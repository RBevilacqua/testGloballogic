//
//  ListViewModel.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {
    
    var laptop: [LaptopModel]?
    
    func getLaptop(callback: @escaping (_ data: [LaptopModel]?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        
        LaptopModel.getLaptop { [weak self] (data, response, error) in
            
            self?.laptop = data
            callback(self?.laptop, response, error)
            
        }
    }

}
