//
//  Coordinator.swift
//  MovieDB
//
//  Created by João Brentano on 10/03/22.
//

import Foundation
import SwiftUI

class Coordinator {
    
    func changeScreen<L: View> (currentScreen: String, movie: Movie, label: () -> L) -> some View {
        NavigationLink {
            DetailView(movie: movie)
        } label: {
            label()
        }
    }

    func changeScreen<L: View> (currentScreen: String, label: () -> L) -> some View {
        NavigationLink {
            ContentView()
        } label: {
            label()
        }
    }
    
}
