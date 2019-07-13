//
//  NewReleaseMovie.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class NewReleaseMovie: Movie {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func determineAmount(daysRented: Int) -> Double {
        return Double(daysRented * 3)
    }
    
    func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}
