//
//  Movie.swift
//  MovieDB-MVC-Coordinator
//
//  Created by Lucas Dimer Justo on 07/03/22.
//

import Foundation
import UIKit

enum Category {
    case nowPlaying, popular
}

struct Movie: CustomStringConvertible {
    let title: String
    let rate: Double
    let overview: String
    let genreIds: [Int]
    let posterPath: String
    
    var description: String {
        return "\(title)   \(rate)   \(overview)   \(genreIds)   \(posterPath)"
    }
}

public class MovieService {
    
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
                movieList.append(Movie(title: title ?? "", rate: rate ?? 0, overview: overview ?? "", genreIds: genreIds ?? [], posterPath: posterPath ?? ""))
            }
            completionHandler(movieList)
        }.resume()
    }
    
    func getPosterByPath(posterPath: String, completionHandler: @escaping (UIImage) -> Void){
        let url: URL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
        var poster: UIImage?
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data
            else {
                completionHandler(UIImage(named: "placeHolder")!)
                return
            }
            poster = UIImage(data: data)
            completionHandler(poster!)
        }.resume()
        
    }
}
