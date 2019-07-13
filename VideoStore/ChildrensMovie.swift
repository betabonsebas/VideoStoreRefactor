//
//  ChildrensMovie.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class ChildrensMovie: Movie {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func determineAmount(daysRented: Int) -> Double {
        var rentalAmount: Double = 1.5
        if daysRented > 3 {
            rentalAmount += Double(daysRented - 3) * 1.5
        }
        
        return rentalAmount
    }
    
    func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}
