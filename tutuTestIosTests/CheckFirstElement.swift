//
//  CheckFirstElement.swift
//  tutuTestIos
//
//  Created by Nick on 29.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import XCTest

@testable import tutuTestIos

class CheckFirstElement: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//Проверка первого элемента JSON
    
    func testcheckFirstElement() {
        
        let array = DepartureTableViewController()
        
        array.loadJson()
        
        let firstElement = "Австрия"
        let checkedElement = array.dataCT[0].country
        
        XCTAssertEqual(firstElement, checkedElement)
        
    }
    
}
