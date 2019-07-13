//
//  Rental.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

class Rental {
    private let movie: Movie
    private let daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    var getDaysRented: Int {
        return daysRented
    }
    
    var getMovie: Movie {
        return movie
    }
    
    var getTitle: String {
        return movie.getTitle
    }
    
    func determineAmount() -> Double {
        return movie.determineAmount(daysRented: daysRented)
    }
    
    func determineFrequentRenterPoints() -> Int {
        return movie.determineFrequentRenterPoints(daysRented: daysRented)
    }
    
}
