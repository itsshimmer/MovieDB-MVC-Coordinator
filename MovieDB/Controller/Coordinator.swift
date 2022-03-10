//
//  Coordinator.swift
//  MovieDB
//
//  Created by João Brentano on 10/03/22.
//

import Foundation

var view = "Main"
var selectedMovie: Movie = Movie(id: 0, title: "", description: "", year: 0, genre: "", rate: 0.0, duration: "")

func changeScreen(currentScreen: String, movie: Movie) {
    if currentScreen == "ContentView" {
        selectedMovie = movie
        view = "DetailView"
    }
}
