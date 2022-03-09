//
//  Movie.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//

import Foundation
import SwiftUI

struct Movie {
    
    var id: Int
    var title: String
    var description: String
    var year: Int
    var genre: String
    var rate: Double
    var duration: String
    
    
    var image: Image {
        Image(title)
    }
}

var movies: [Movie] = [
    Movie(id: 1, title: "Another Round", description: "Four high school teachers launch a drinking experiment: upholding a constant low level of intoxication.", year: 2020, genre: "Comedy, Drama", rate: 7.8, duration: "1h 57m"),
    Movie(id: 2, title: "Raya and the Last Dragon", description: "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.", year: 2021, genre: "Animation, Adventure, Fantasy, Family, Action", rate: 8.4, duration: "1h 47m"),
    Movie(id: 3, title: "Godzilla vs. Kong", description: "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.", year: 2021, genre: "Action, Science Fiction", rate: 7.5, duration: "1h 53m"),
    Movie(id: 4, title: "Tom & Jerry", description: "Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse.", year: 2021, genre: "Action, Comedy, Family, Animation", rate: 7.4, duration: "1h 41m"),
    Movie(id: 5, title: "Monster Hunter", description: "A portal transports Cpt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be their only hope to find a way home.", year: 2020, genre: "Fantasy, Action, Adventure", rate: 7.2, duration: "1h 44m")
]
