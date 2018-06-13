//
//  FavoriteMoviesViewController.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 6/12/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import UIKit

class FavoriteMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteMovies: [Movie] = []
    
     var mainTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let idx: Int = indexPath.row
        
        movieCell.movieTitle?.text = favoriteMovies[idx].title
        movieCell.movieYear?.text = favoriteMovies[idx].year
        displayMovieImage(idx, moviecell: movieCell)
        return movieCell
        
    }
    
    func displayMovieImage(_ row: Int, moviecell: CustomTableViewCell) {
        let url: String = (URL(string: favoriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
        }).resume()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if favoriteMovies.count == 0{
            favoriteMovies.append(Movie(id: "tt0372784", title: "Batman Begins" , year: "2005", imageUrl: "https://vignette3.wikia.nocookie.net/batman/images/b/b2/Batman-begins_15.jpg/revision/latest/scale-to-width-down/2000?cb=20160913155903" ))
        }
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchMoviesSegue" {
            let controller = segue.destination as! MovieSearchViewController
            controller.delegate = self
        }
    
       
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }
    
}
