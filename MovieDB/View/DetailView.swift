//
//  DetailView.swift
//  MovieDB
//
//  Created by João Brentano on 26/03/21.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    var body: some View {
        VStack {
            Divider()
            HStack {
                
                movie.image
                    .resizable()
                    .cornerRadius(25)
                    .frame(width: 125, height: 200, alignment: .bottom)
                    .padding(5)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .bold()
                    Text("Action")
                        .font(.subheadline)
                    
                    
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .padding(5)
                        Text(String(movie.rate))
                            .font(.caption)
                            .bold()
                        //Spacer()
                    }
                    
                }
                
                Spacer()
                
            }
            Divider()
            HStack {
                Text("Overview")
                    .bold()
                    .padding(5)
                Spacer()
            }
            Text(movie.description)
                .padding(.leading, 5)
                .font(.caption)
            Spacer()
        }
        
    
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(id: 0, title: "", rate: 5.0, overview: "", genreIds: [2], posterPath: "", image: Image("placeHolder")))
    }
}
