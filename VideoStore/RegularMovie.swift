//
//  RegularMovie.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/13/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class RegularMovie: Movie {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func determineAmount(daysRented: Int) -> Double {
        var rentalAmount: Double = 2
        if daysRented > 2 {
            rentalAmount += Double(daysRented - 2) * 1.5
        }
        
        return rentalAmount
    }
    
    func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}
