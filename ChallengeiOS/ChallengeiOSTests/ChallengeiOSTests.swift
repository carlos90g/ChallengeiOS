//
//  ChallengeiOSTests.swift
//  ChallengeiOSTests
//
//  Created by Carlos Garcia on 16/06/2021.
//

import XCTest
@testable import ChallengeiOS

class ChallengeiOSTests: XCTestCase {
    
    let mockPresenter = MockHomePresenter()
    
    
    override func setUp() {
        
    }
    
    func testSuccessfullPayments (){
        let expectation = self.expectation(description: "completed")
        expectation.isInverted = true
        mockPresenter.service.currentResult = mockPresenter.service.resultSuccess
        mockPresenter.getAPIPaymentsData()
        waitForExpectations(timeout: 2.0, handler: { (error) in
            expectation.fulfill()
        })
        XCTAssertTrue(mockPresenter.getPaymentsCount() == 3, "")
    }
    
    func testErrorPayments (){
        let expectation = self.expectation(description: "completed")
        expectation.isInverted = true
        mockPresenter.service.currentResult = mockPresenter.service.resultError
        mockPresenter.getAPIPaymentsData()
        waitForExpectations(timeout: 2.0, handler: { (error) in
            expectation.fulfill()
        })
        XCTAssertTrue(mockPresenter.getPaymentsCount() == 0, "")
    }
    
}
