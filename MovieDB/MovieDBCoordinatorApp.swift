//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//

import SwiftUI

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
