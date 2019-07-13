//
//  Moview.swift
//  VideoStore
//
//  Created by Sebastian Bonilla Betancur on 7/12/19.
//  Copyright © 2019 Sebastian Bonilla Betancur. All rights reserved.
//

import Foundation

protocol Movie {
    var title: String { get }
    
    func determineAmount(daysRented: Int) -> Double
    func determineFrequentRenterPoints(daysRented: Int) -> Int
}
