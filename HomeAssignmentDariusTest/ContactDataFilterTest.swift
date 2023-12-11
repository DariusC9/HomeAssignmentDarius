//
//  ContactDataFilterTest.swift
//  HomeAssignmentDariusTest
//
//  Created by Darius Couti on 11.12.2023.
//

import XCTest

@testable import HomeAssignmentDarius

final class ContactDataFilterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilter() throws {
        
        let contactData = [
                    ContactData(id: 0, name: "John Doe", email: "", gender: "", status: .active),
                    ContactData(id: 1, name: "John Doe", email: "", gender: "", status: .active),
                    ContactData(id: 2, name: "John Doe", email: "", gender: "", status: .inactive),
                ]

                let filteredData = ContactDataFilter.filter(unfilteredData: contactData)
                
                XCTAssertEqual(filteredData.count, 2)
    }


}
