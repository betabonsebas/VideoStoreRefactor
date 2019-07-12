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
    
}
