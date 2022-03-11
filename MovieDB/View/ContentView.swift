//
//  ContentView.swift
//  MovieDB
//
//  Created by João Brentano on 25/03/21.
//
import SwiftUI

struct ContentView: View {
    
    var coordinator: Coordinator
    var contentController: ContentController
    
    init(coordinator: Coordinator, contentController: ContentController){
        self.coordinator = coordinator
        self.contentController = contentController
        contentController.semaphore.wait()
        contentController.semaphore.wait()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                    HStack {
                        Text("Popular Movies")
                            .fontWeight(.semibold)
                            .padding(.leading, 5)
                        Spacer()
                    }
                    .padding(5)
                    VStack {
                        ForEach(contentController.popularMovies.prefix(2), id: \.id) { aMovie in
                            coordinator.changeScreen(currentScreen: "Main", movie: aMovie) {
                                HStack {
                                    aMovie.image
                                        .resizable()
                                        .cornerRadius(25)
                                        .frame(width: 75, height: 125)
                                        .padding(.leading, 5)
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
                                            .multilineTextAlignment(.leading)
                                        HStack {
                                            Image(systemName: "star")
                                                .resizable()
                                                .frame(width: 11, height: 11)
                                                .padding(.leading, 2)
                                                .foregroundColor(Color.gray)
                                            Text(String(aMovie.rate))
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(Color.gray)
                                            Spacer()
                                        }
                                        .foregroundColor(Color.black)
                                        
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 5)
                            }
                        }
                    }
                        Divider()
                        HStack {
                            Text("Now Playing")
                                .fontWeight(.semibold)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        ScrollView {
                            VStack {
                                ForEach(contentController.nowPlayingMovies, id: \.id) { aMovie in
                                    coordinator.changeScreen(currentScreen: "Main", movie: aMovie) {
                                        HStack {
                                            aMovie.image
                                                .resizable()
                                                .cornerRadius(25)
                                                .frame(width: 75, height: 125)
                                                .padding(.leading, 5)
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
                                                    .multilineTextAlignment(.leading)
                                                HStack {
                                                    Image(systemName: "star")
                                                        .resizable()
                                                        .frame(width: 11, height: 11)
                                                        .padding(.leading, 2)
                                                        .foregroundColor(Color.gray)
                                                    Text(String(aMovie.rate))
                                                        .font(.caption)
                                                        .bold()
                                                        .foregroundColor(Color.gray)
                                                    Spacer()
                                                }
                                                .foregroundColor(Color.black)
                                            }
                                            Spacer()
                                        }
                                        .padding(.leading, 5)
                                    }
                                }
                                
                            }
                        }
                    Spacer()
                }
            }
            .navigationTitle("Movies")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator: Coordinator(), contentController: ContentController())
    }
}
