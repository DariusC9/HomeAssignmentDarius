//
//  StringExtensionTests.swift
//  HomeAssignmentDariusTest
//
//  Created by Darius Couti on 11.12.2023.
//

import XCTest

@testable import HomeAssignmentDarius

final class StringExtensionTests: XCTestCase {
    
    var string: String!

    override func setUpWithError() throws {
        string = "John Doe"
    }

    override func tearDownWithError() throws {
        string = nil
    }

    func testInitialExtension() throws {
        let initials = string.getInitials()
        XCTAssertEqual(initials, "JD")
    }
    
    func testFirstNameExtension() throws {
        let firstName = string?.getFirstName()
        XCTAssertEqual(firstName, "John")
    }
    
    func testLastNameExtension() throws {
        let firstName = string?.getLastName()
        XCTAssertEqual(firstName, "Doe")
    }
    
    func testPhoneFormat() throws {
        let phone = "0740100100"
        let phoneFormatted = phone.formatPhoneNumber()
        XCTAssertEqual(phoneFormatted, "0740 100 100")
    }
}
