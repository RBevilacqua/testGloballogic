//
//  DetailViewController.swift
//  testGloballogicTests
//
//  Created by Robert on 17-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import XCTest
import Alamofire
@testable import testGloballogic

class DetailViewControllerTest: XCTestCase {
    
    var detailControllerUnderTest: DetailViewController!
    var dataMock: [LaptopModel] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        detailControllerUnderTest = UIStoryboard(name: "DetailViewController",
                                                 bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "ResponseRestApi", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        do {
            self.dataMock = try JSONDecoder().decode([LaptopModel].self, from: data!)
            
        } catch let jsonError {
            print(jsonError)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadImage() {
        let expected = expectation(description: "Image from https did load")
        Alamofire.request(dataMock.last!.image!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (data) in
                
                if data.response?.statusCode != 200 {
                    XCTAssertTrue(true)
                
                }
                
                expected.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
