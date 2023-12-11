//
//  DateCreatorTest.swift
//  HomeAssignmentDariusTest
//
//  Created by Darius Couti on 11.12.2023.
//

import XCTest

@testable import HomeAssignmentDarius

final class DateCreatorTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testDateCreator() throws {
        let dateString = "2009-01-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let expectedDate = dateFormatter.date(from: dateString)
        
        let createdDate = DateCreator.createOldDate()
        
        XCTAssertEqual(createdDate, expectedDate)
        
    }
}
