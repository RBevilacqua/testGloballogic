//
//  MessageTest.swift
//  testGloballogicTests
//
//  Created by Robert on 17-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import XCTest
@testable import testGloballogic

class MessageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        Message.show(text: "Test Success", type: .success)
        
        Message.show(text: "Test Fail", type: .warning)
        
        Message.show(text: "Test with completion", timer: 2.0, type: .success) {
            XCTAssertTrue(true)
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
