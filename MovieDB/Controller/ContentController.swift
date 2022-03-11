//
//  ContentController.swift
//  MovieDB
//
//  Created by Lucas Dimer Justo on 11/03/22.
//

import Foundation
import UIKit
import SwiftUI

enum Category {
    case nowPlaying, popular
}

class ContentController {
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
    
    init() {
        getMovies(category: .popular) { movies in
            self.popularMovies = movies
            self.semaphore.signal()
        }
        getMovies(category: .nowPlaying) { movies in
            self.nowPlayingMovies = movies
            self.semaphore.signal()
        }
    }
    
    func getMovies(page: Int = 1, category: Category, completionHandler: @escaping ([Movie]) -> Void){
        var url: URL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=dd5a68ffc24d87f1b7ff8161056a315f&page=\(page)")!
        
        if category == Category.popular {
            url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=dd5a68ffc24d87f1b7ff8161056a315f&page=\(page)")!
        }
        
        var movieList = [Movie]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                  let movies = json["results"] as? [[String: Any]]
            else {
                completionHandler([])
                return
            }
            
            for movie in movies {
                let title = movie["title"] as? String
                let rate = movie["vote_average"] as? Double
                let overview = movie["overview"] as? String
                let genreIds = movie["genre_ids"] as? [Int]
                let posterPath = movie["poster_path"] as? String
                movieList.append(Movie(id: movieList.count, title: title ?? "", rate: rate ?? 0, overview: overview ?? "", genreIds: genreIds ?? [], posterPath: posterPath ?? "", image: Image("placeHolder")))
            }
            completionHandler(movieList)
        }.resume()
    }
    
    func getPosterByPath(posterPath: String, completionHandler: @escaping (Image) -> Void){
        let url: URL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
        var poster: Image?
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data
            else {
                completionHandler(Image("placeHolder"))
                return
            }
            poster = Image(uiImage: (UIImage(data: data) ?? UIImage(named: "placeHolder"))!)
            completionHandler(poster!)
        }.resume()
        
    }
}
