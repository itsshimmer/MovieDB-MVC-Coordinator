//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//

import SwiftUI

var view = "Main"
var selectedMovie: Movie = Movie(id: 0, title: "", description: "", year: 0, genre: "", rate: 0.0, duration: "")

func changeScreen(currentScreen: String, movie: Movie) {
    if currentScreen == "ContentView" {
        selectedMovie = movie
        view = "DetailView"
    }
    
}

@main
struct MovieDBApp: App {
    var body: some Scene {
        
        WindowGroup {
            switch(view) {
            case "Main":
                ContentView()
            case "DetailView":
                DetailView(movie: selectedMovie)
            default:
                ContentView()
            }
        }
    }
}
