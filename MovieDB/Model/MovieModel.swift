//
//  Movie.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//

import Foundation
import SwiftUI

struct Movie: CustomStringConvertible {
    let id: Int
    let title: String
    let rate: Double
    let overview: String
    let genreIds: [Int]
    let posterPath: String
    let image: Image
    
    var description: String {
        return "\(title)   \(rate)   \(overview)   \(genreIds)   \(posterPath)"
    }
}
