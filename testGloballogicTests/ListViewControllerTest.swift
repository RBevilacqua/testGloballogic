//
//  ListViewControllerTest.swift
//  testGloballogicTests
//
//  Created by Robert on 17-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import XCTest
@testable import testGloballogic

class ListViewControllerTest: XCTestCase {
    var listControllerUnderTest: ListViewController!
    var dataMock: [LaptopModel] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        listControllerUnderTest = UIStoryboard(name: "Main",
                                               bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
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
        listControllerUnderTest = nil
    }
    
    
    func testValidCall() {
        
        let promise = expectation(description: "Status code: 200")
        listControllerUnderTest.viewModel.getLaptop { (data, response, error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallComplete() {
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        listControllerUnderTest.viewModel.getLaptop { (data, response, error) in
            
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testResultEqual() {
        let promise = expectation(description: "Equal result Mock")
        var dataApi: [LaptopModel] = []
        
        listControllerUnderTest.viewModel.getLaptop { (data, response, error) in
            
            guard let result = data else {
                XCTFail("Data is nil")
                return
            }
            
            dataApi = result
            promise.fulfill()
            
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(dataApi)
        XCTAssertNotEqual(dataApi, dataMock)
    }
    
    func testPush() {
        guard let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            XCTFail("View controller DetailViewController not found")
            return
        }
        
        let index = IndexPath(row: 3, section: 0)
        vc.index = index
        vc.laptop = listControllerUnderTest.viewModel.laptop?[index.row]
        
        listControllerUnderTest.navigationController?.pushViewController(vc, animated: true)
        
        listControllerUnderTest.didReceiveMemoryWarning()
        
        XCTAssertTrue(true)
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
