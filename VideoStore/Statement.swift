//
//  Customer.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class Statement {
    private let customerName: String
    private var rentals: [Rental] = []
    private var totalAmount: Double?
    private var frequentRenterPoints: Int?
    
    init(customerName: String) {
        self.customerName = customerName
    }
    
    func addRental(arg: Rental) {
        rentals.append(arg)
    }
    
    var getCustomerName: String {
        return customerName
    }
    
    func generate() -> String {
        clearTotals()
        var statementText = header()
        statementText += rentalLines()
        statementText += footer()
        return statementText
    }
    
    private func clearTotals() {
        totalAmount = 0
        frequentRenterPoints = 0
    }
    
    private func header() -> String {
        return "Rental Record for \(customerName)\n"
    }
    
    private func rentalLines() -> String {
        var rentalLines = ""
        for rental in rentals {
            rentalLines += rentalLine(rental)
        }
        return rentalLines
    }
    
    private func rentalLine(_ rental: Rental) -> String {
        let rentalAmount: Double = rental.determineAmount()
        frequentRenterPoints! += rental.determineFrequentRenterPoints()
        totalAmount! += rentalAmount
        
        return formatRentalLine(rental: rental, rentalAmount)
    }
    
    fileprivate func formatRentalLine(rental: Rental, _ rentalAmount: Double) -> String {
        return  "\t\(rental.getTitle)\t\(rentalAmount)\n"
    }
    
    private func footer() -> String {
        return "Amount owed is \(totalAmount ?? 0.0)\nYou earned \(frequentRenterPoints ?? 0) frequent renter points"
    }
    
    func getTotal() -> Double {
        return totalAmount ?? 0.0
    }
    
    func getFrequentRenterPoints() -> Int {
        return frequentRenterPoints ?? 0
    }
    
}
