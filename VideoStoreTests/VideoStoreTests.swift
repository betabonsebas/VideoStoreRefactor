//
//  VideoStoreTests.swift
//  VideoStoreTests
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//


import XCTest
@testable import VideoStore

class VideoStoreTests: XCTestCase {

    var customer: Customer!
    override func setUp() {
        customer = Customer(name: "Fred")
    }

    func testSingleNewReleaseStatement() {
        customer.addRental(arg: Rental(movie: Movie(title: "The Cell", priceCode: .newRelease), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\nAmount owed is 9.0\nYou earned 2 frequent renter points", customer.statement())
    }
    
    func testDualNewReleaseStatement() {
        customer.addRental(arg: Rental(movie: Movie(title: "The Cell", priceCode: .newRelease), daysRented: 3))
        customer.addRental(arg: Rental(movie: Movie(title: "The Tigger Movie", priceCode: .newRelease), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\n\tThe Tigger Movie\t9.0\nAmount owed is 18.0\nYou earned 4 frequent renter points", customer.statement())
    }
    
    func testSingleNewChildrensStatement() {
        customer.addRental(arg: Rental(movie: Movie(title: "The Tigger Movie", priceCode: .childrens), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Tigger Movie\t1.5\nAmount owed is 1.5\nYou earned 1 frequent renter points", customer.statement())
    }
    
    func testMultipleRegularStatement() {
        customer.addRental(arg: Rental(movie: Movie(title: "Plan 9 from Outer Space", priceCode: .regular), daysRented: 1))
        customer.addRental(arg: Rental(movie: Movie(title: "8 1/2", priceCode: .regular), daysRented: 2))
        customer.addRental(arg: Rental(movie: Movie(title: "Eraserhead", priceCode: .regular), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tPlan 9 from Outer Space\t2.0\n\t8 1/2\t2.0\n\tEraserhead\t3.5\nAmount owed is 7.5\nYou earned 3 frequent renter points", customer.statement())
    }

}
