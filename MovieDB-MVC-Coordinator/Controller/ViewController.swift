//
//  ViewController.swift
//  MovieDB-MVC-Coordinator
//
//  Created by João Brentano on 03/03/22.
//

import UIKit

let movies: [Movie] = [Movie(title: "", rate: 5.0, overview: "", genreIds: [], posterPath: "")]

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellView", for: indexPath)
        
        return cell
    }
    
}
