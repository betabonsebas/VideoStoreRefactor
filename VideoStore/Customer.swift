//
//  Customer.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class Customer {
    private let name: String
    private var rentals: [Rental] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(arg: Rental) {
        rentals.append(arg)
    }
    
    var getName: String {
        return name
    }
    
    func statement() -> String {
        var totalAmount: Double = 0
        var frequentRenterPoints: Int = 0
        var result = "Rental Record for " + getName + "\n"
        
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
            frequentRenterPoints += 1;
            
            // add bonus for a two day new release rental
            if case MovieType.newRelease = each.getMovie.getPriceCode, each.getDaysRented > 1 {
                frequentRenterPoints += 1
            }
            
            //show figures for this rental
            result += "\t" + each.getMovie.getTitle + "\t" + String(thisAmount) + "\n"
            totalAmount += thisAmount
        }
        
        //add footer lines
        result += "Amount owed is " + String(totalAmount) + "\n"
        result += "You earned " + String(frequentRenterPoints) + " frequent renter points"
        return result
    }
    
}
