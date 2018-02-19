//
//  testGloballogicUITests.swift
//  testGloballogicUITests
//
//  Created by Robert on 17-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import XCTest

class testGloballogicUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDetailView() {
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Laptop 4"]/*[[".cells.staticTexts[\"Laptop 4\"]",".staticTexts[\"Laptop 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"testGloballogic.DetailView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let laptop4StaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Laptop 4"]/*[[".scrollViews.staticTexts[\"Laptop 4\"]",".staticTexts[\"Laptop 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        laptop4StaticText.tap()
        
        let textField = app/*@START_MENU_TOKEN@*/.staticTexts["Maecenas ornare nisl non lacus viverra, at placerat mauris iaculis. Morbi convallis varius mi, luctus bibendum quam venenatis nec. Quisque facilisis hendrerit odio, id rhoncus metus tempor cursus. Suspendisse sagittis nisl eget efficitur varius. Integer efficitur faucibus faucibus. Cras mauris mauris, molestie non velit sed, fringilla porttitor felis. Sed et ultricies eros. Nam vulputate tincidunt augue vulputate tristique. Sed libero nibh, rhoncus sollicitudin velit non, efficitur dapibus risus. In id massa at justo condimentum lacinia. Pellentesque ut sapien a eros commodo bibendum lacinia non orci. Suspendisse non lacus non augue egestas suscipit. Vivamus blandit, metus ut porttitor rutrum, ipsum turpis sagittis nisl, vestibulum blandit eros ex convallis enim."]/*[[".scrollViews.staticTexts[\"Maecenas ornare nisl non lacus viverra, at placerat mauris iaculis. Morbi convallis varius mi, luctus bibendum quam venenatis nec. Quisque facilisis hendrerit odio, id rhoncus metus tempor cursus. Suspendisse sagittis nisl eget efficitur varius. Integer efficitur faucibus faucibus. Cras mauris mauris, molestie non velit sed, fringilla porttitor felis. Sed et ultricies eros. Nam vulputate tincidunt augue vulputate tristique. Sed libero nibh, rhoncus sollicitudin velit non, efficitur dapibus risus. In id massa at justo condimentum lacinia. Pellentesque ut sapien a eros commodo bibendum lacinia non orci. Suspendisse non lacus non augue egestas suscipit. Vivamus blandit, metus ut porttitor rutrum, ipsum turpis sagittis nisl, vestibulum blandit eros ex convallis enim.\"]",".staticTexts[\"Maecenas ornare nisl non lacus viverra, at placerat mauris iaculis. Morbi convallis varius mi, luctus bibendum quam venenatis nec. Quisque facilisis hendrerit odio, id rhoncus metus tempor cursus. Suspendisse sagittis nisl eget efficitur varius. Integer efficitur faucibus faucibus. Cras mauris mauris, molestie non velit sed, fringilla porttitor felis. Sed et ultricies eros. Nam vulputate tincidunt augue vulputate tristique. Sed libero nibh, rhoncus sollicitudin velit non, efficitur dapibus risus. In id massa at justo condimentum lacinia. Pellentesque ut sapien a eros commodo bibendum lacinia non orci. Suspendisse non lacus non augue egestas suscipit. Vivamus blandit, metus ut porttitor rutrum, ipsum turpis sagittis nisl, vestibulum blandit eros ex convallis enim.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        textField.tap()
        laptop4StaticText.tap()
        app.navigationBars["testGloballogic.DetailView"].tap()
        XCUIDevice.shared.orientation = .landscapeRight
        textField.swipeLeft()
        XCUIDevice.shared.orientation = .portrait
        
        
    }
    
    func testMainView()  {
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mauris eu congue lacus. Etiam vel feugiat neque, nec mollis arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec bibendum facilisis felis vitae ultricies. Nam posuere purus pharetra leo accumsan, quis lacinia urna venenatis. Ut non volutpat libero. Proin maximus efficitur fringilla. Suspendisse interdum felis fringilla fermentum maximus."]/*[[".cells.staticTexts[\"Mauris eu congue lacus. Etiam vel feugiat neque, nec mollis arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec bibendum facilisis felis vitae ultricies. Nam posuere purus pharetra leo accumsan, quis lacinia urna venenatis. Ut non volutpat libero. Proin maximus efficitur fringilla. Suspendisse interdum felis fringilla fermentum maximus.\"]",".staticTexts[\"Mauris eu congue lacus. Etiam vel feugiat neque, nec mollis arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec bibendum facilisis felis vitae ultricies. Nam posuere purus pharetra leo accumsan, quis lacinia urna venenatis. Ut non volutpat libero. Proin maximus efficitur fringilla. Suspendisse interdum felis fringilla fermentum maximus.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let backButton = app.navigationBars["testGloballogic.DetailView"].buttons["Back"]
        backButton.tap()
        XCUIDevice.shared.orientation = .landscapeRight
        XCUIDevice.shared.orientation = .portraitUpsideDown
        XCUIDevice.shared.orientation = .landscapeLeft
        XCUIDevice.shared.orientation = .portrait
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mauris convallis dolor et enim tristique vulputate. Nullam sed metus odio. Vivamus finibus ex vel sem viverra feugiat. Cras at gravida sem. Etiam massa orci, mollis sed mi at, vestibulum dapibus enim. In eleifend pulvinar ultricies. Suspendisse nec quam lacus. Maecenas ultrices nulla urna, in euismod sem venenatis vitae. Suspendisse lacinia ante tortor, eget pharetra quam fringilla eu. Aenean finibus interdum lacus, viverra bibendum sapien aliquam et. Vivamus maximus sed neque a dignissim. Vivamus laoreet justo id ligula tempus dictum. Curabitur eu sapien egestas, finibus ipsum in, pellentesque enim. Morbi mollis, massa in varius suscipit, eros urna viverra sem, vel tincidunt turpis dui nec dui. Nam eget ex lacus."]/*[[".cells.staticTexts[\"Mauris convallis dolor et enim tristique vulputate. Nullam sed metus odio. Vivamus finibus ex vel sem viverra feugiat. Cras at gravida sem. Etiam massa orci, mollis sed mi at, vestibulum dapibus enim. In eleifend pulvinar ultricies. Suspendisse nec quam lacus. Maecenas ultrices nulla urna, in euismod sem venenatis vitae. Suspendisse lacinia ante tortor, eget pharetra quam fringilla eu. Aenean finibus interdum lacus, viverra bibendum sapien aliquam et. Vivamus maximus sed neque a dignissim. Vivamus laoreet justo id ligula tempus dictum. Curabitur eu sapien egestas, finibus ipsum in, pellentesque enim. Morbi mollis, massa in varius suscipit, eros urna viverra sem, vel tincidunt turpis dui nec dui. Nam eget ex lacus.\"]",".staticTexts[\"Mauris convallis dolor et enim tristique vulputate. Nullam sed metus odio. Vivamus finibus ex vel sem viverra feugiat. Cras at gravida sem. Etiam massa orci, mollis sed mi at, vestibulum dapibus enim. In eleifend pulvinar ultricies. Suspendisse nec quam lacus. Maecenas ultrices nulla urna, in euismod sem venenatis vitae. Suspendisse lacinia ante tortor, eget pharetra quam fringilla eu. Aenean finibus interdum lacus, viverra bibendum sapien aliquam et. Vivamus maximus sed neque a dignissim. Vivamus laoreet justo id ligula tempus dictum. Curabitur eu sapien egestas, finibus ipsum in, pellentesque enim. Morbi mollis, massa in varius suscipit, eros urna viverra sem, vel tincidunt turpis dui nec dui. Nam eget ex lacus.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
}



