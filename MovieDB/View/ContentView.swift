//
//  ContentView.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//
import SwiftUI

struct ContentView: View {
    
    var coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                    HStack {
                        Text("Now Playing")
                        Spacer()
                        Text("See All")
                    }
                    .padding(5)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(movies, id: \.id) { aMovie in
                                coordinator.changeScreen(currentScreen: "Main", movie: aMovie) {
                                    VStack {
                                        aMovie.image
                                            .resizable()
                                            .cornerRadius(25)
                                            .frame(width: 125, height: 200)
                                            .padding(5)
                                        
                                        Text(aMovie.title)
                                            .foregroundColor(Color.black)
                                        
                                        HStack() {
                                            Image(systemName: "star")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .padding(5)
                                            Text(String(aMovie.rate))
                                                .font(.caption)
                                                .bold()
                                            Spacer()
                                        }
                                        .foregroundColor(Color.black)
                                    }
                                }
                            }
                        }
                        
                    }
                    Divider()
                    HStack {
                        Text("Popular Movies")
                            .padding(5)
                        Spacer()
                    }
                    ScrollView {
                        VStack {
                            ForEach(movies, id: \.id) { aMovie in
                                coordinator.changeScreen(currentScreen: "Main", movie: aMovie) {
                                    HStack {
                                        aMovie.image
                                            .resizable()
                                            .cornerRadius(25)
                                            .frame(width: 75, height: 125)
                                            .padding(5)
                                        VStack {
                                            HStack {
                                                Text(aMovie.title)
                                                    .foregroundColor(Color.black)
                                                Spacer()
                                            }
                                            Text(aMovie.description)
                                                .font(.footnote)
                                                .lineLimit(3)
                                                .padding(1)
                                                .foregroundColor(Color.gray)
                                            
                                            HStack {
                                                Image(systemName: "star")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                                    .padding(5)
                                                Text(String(aMovie.rate))
                                                    .font(.caption)
                                                    .bold()
                                                Spacer()
                                            }
                                            .foregroundColor(Color.black)
                                            
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            //Spacer()
            .navigationTitle("MovieDB")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
