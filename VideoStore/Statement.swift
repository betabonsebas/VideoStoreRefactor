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
        totalAmount = 0
        frequentRenterPoints = 0
        var result = "Rental Record for " + getCustomerName + "\n"
        
        for each in rentals {
            var thisAmount: Double = 0
            
            //determine amounts for each line
            switch each.getMovie.getPriceCode {
            case .regular:
                thisAmount += 2
                if each.getDaysRented > 2 {
                    thisAmount += Double(each.getDaysRented - 2) * 1.5
                }
            case .childrens:
                thisAmount += 1.5
                if each.getDaysRented > 3 {
                    thisAmount += Double(each.getDaysRented - 3) * 1.5
                }
            case .newRelease:
                thisAmount += Double(each.getDaysRented * 3)
            }
            
            // add frequent renter points
            frequentRenterPoints! += 1;
            
            // add bonus for a two day new release rental
            if case MovieType.newRelease = each.getMovie.getPriceCode, each.getDaysRented > 1 {
                frequentRenterPoints = frequentRenterPoints! + 1
            }
            
            //show figures for this rental
            result += "\t" + each.getMovie.getTitle + "\t" + String(thisAmount) + "\n"
            totalAmount! += thisAmount
        }
        
        //add footer lines
        result += "Amount owed is " + String(getTotal()) + "\n"
        result += "You earned " + String(getFrequentRenterPoints()) + " frequent renter points"
        return result
    }
    
    func getTotal() -> Double {
        return totalAmount ?? 0.0
    }
    
    func getFrequentRenterPoints() -> Int {
        return frequentRenterPoints ?? 0
    }
    
}
