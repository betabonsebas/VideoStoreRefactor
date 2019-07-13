//
//  Moview.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

enum MovieType {
    case childrens, regular, newRelease
}

class Movie {
    private let title: String
    private var priceCode: MovieType
    
    init(title: String, priceCode: MovieType) {
        self.title = title
        self.priceCode = priceCode
    }
    
    var getPriceCode: MovieType {
        return priceCode
    }
    
    func setPriceCode(arg: MovieType) {
        self.priceCode = arg
    }
    
    var getTitle: String {
        return title
    }
    
    func determineAmount(daysRented: Int) -> Double {
        var rentalAmount: Double = 0
        
        switch getPriceCode {
        case .regular:
            rentalAmount += 2
            if daysRented > 2 {
                rentalAmount += Double(daysRented - 2) * 1.5
            }
        case .childrens:
            rentalAmount += 1.5
            if daysRented > 3 {
                rentalAmount += Double(daysRented - 3) * 1.5
            }
        case .newRelease:
            rentalAmount += Double(daysRented * 3)
        }
        return rentalAmount
    }
    
    func determineFrequentRenterPoints(daysRented: Int) -> Int {
        let bonusIsEarned = (getPriceCode == MovieType.newRelease && daysRented > 1)
        if bonusIsEarned {
            return 2
        }
        return 1
    }
    
}
