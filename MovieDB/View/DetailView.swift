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
            //Divider()
            HStack {
                
                movie.image
                    .resizable()
                    .cornerRadius(25)
                    .frame(width: 125, height: 200, alignment: .bottom)
                    .padding(.leading, 10)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 5)
                    Text("Action")
                        .font(.subheadline)
                        .padding(.leading, 5)
                        .padding(.top, -2)
                    
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 11, height: 11)
                            .foregroundColor(Color.gray)
                            .padding(.leading, 5)
                        Text(String(movie.rate))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                        //Spacer()
                    }
                    
                }
                
                Spacer()
                
            }
            //Divider()
            HStack {
                Text("Overview")
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                Spacer()
            }
            Text(movie.description)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
                .padding([.leading, .trailing], 10)
                .padding(.top, 5)
                .font(.caption)
            Spacer()
        }
        
    
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(id: 0, title: "hellooou", rate: 5.0, overview: "", genreIds: [2], posterPath: "", image: Image("placeHolder")))
    }
}
