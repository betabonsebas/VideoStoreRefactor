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

    private var statement: Statement!
    private var newReleaseMovie1: Movie!
    private var newReleaseMovie2: Movie!
    private var childrensMovie: Movie!
    private var regularMovie1: Movie!
    private var regularMovie2: Movie!
    private var regularMovie3: Movie!
    
    override func setUp() {
        statement = Statement(customerName: "Customer")
        newReleaseMovie1 = Movie(title: "New Release 1", priceCode: .newRelease)
        newReleaseMovie2 = Movie(title: "New Release 2", priceCode: .newRelease)
        childrensMovie = Movie(title: "Childrens", priceCode: .childrens)
        regularMovie1 = Movie(title: "Regular Movie 1", priceCode: .regular)
        regularMovie2 = Movie(title: "Regular Movie 2", priceCode: .regular)
        regularMovie3 = Movie(title: "Regular Movie 3", priceCode: .regular)
    }

    func testSingleNewReleaseStatementTotals() {
        statement.addRental(arg: Rental(movie: newReleaseMovie1, daysRented: 3))
        _ = statement.generate()
        XCTAssertEqual(9.0, statement.getTotal())
        XCTAssertEqual(2, statement.getFrequentRenterPoints())
    }
    
    func testDualNewReleaseStatementTotals() {
        statement.addRental(arg: Rental(movie: newReleaseMovie1, daysRented: 3))
        statement.addRental(arg: Rental(movie: newReleaseMovie2, daysRented: 3))
        _ = statement.generate()
        XCTAssertEqual(18.0, statement.getTotal())
        XCTAssertEqual(4, statement.getFrequentRenterPoints())
    }
    
    func testSingleNewChildrensStatementTotals() {
        statement.addRental(arg: Rental(movie: childrensMovie, daysRented: 3))
        _ = statement.generate()
        XCTAssertEqual(1.5, statement.getTotal())
        XCTAssertEqual(1, statement.getFrequentRenterPoints())
    }
    
    func testMultipleRegularStatementTotals() {
        statement.addRental(arg: Rental(movie: regularMovie1, daysRented: 1))
        statement.addRental(arg: Rental(movie: regularMovie2, daysRented: 2))
        statement.addRental(arg: Rental(movie: regularMovie3, daysRented: 3))
        _ = statement.generate()
        XCTAssertEqual(7.5, statement.getTotal())
        XCTAssertEqual(3, statement.getFrequentRenterPoints())
    }
    
    func testMultipleRegularStatementFormat() {
        statement.addRental(arg: Rental(movie: regularMovie1, daysRented: 1))
        statement.addRental(arg: Rental(movie: regularMovie2, daysRented: 2))
        statement.addRental(arg: Rental(movie: regularMovie3, daysRented: 3))
        XCTAssertEqual("Rental Record for Customer\n" +
            "\tRegular Movie 1\t2.0\n" +
            "\tRegular Movie 2\t2.0\n" +
            "\tRegular Movie 3\t3.5\n" +
            "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points", statement.generate())
    }

}
