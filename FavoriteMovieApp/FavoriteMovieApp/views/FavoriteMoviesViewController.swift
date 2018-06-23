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
     var favoriteMovieTableView = UITableView()
    var goToFavoritesSearchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupFavoriteMovieTableView()
        setupGoToFavoritesSearchButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutFavoriteMovieTableView()
        layoutGoToFavoritesSearchButton()
    }

    func setupFavoriteMovieTableView() {
        favoriteMovieTableView.dataSource = self
        
        favoriteMovieTableView.register(FavoriteMovieTableViewCell.self, forCellReuseIdentifier: "customcell")
        favoriteMovieTableView.translatesAutoresizingMaskIntoConstraints = false
        favoriteMovieTableView.rowHeight = 105.0
        view.addSubview(favoriteMovieTableView)
    }
    
    func setupGoToFavoritesSearchButton() {
        goToFavoritesSearchButton.setTitle("Search Favorites!", for: UIControlState())
        goToFavoritesSearchButton.backgroundColor = UIColor(hexString: "#00aced")
        goToFavoritesSearchButton.layer.borderColor = UIColor.gray.cgColor
        goToFavoritesSearchButton.layer.borderWidth = 1
        goToFavoritesSearchButton.setTitleColor(.white, for: UIControlState())
        goToFavoritesSearchButton.isEnabled = true
        goToFavoritesSearchButton.addTarget(self, action: #selector(goToFavoritesSearch), for: .touchUpInside)
        goToFavoritesSearchButton.translatesAutoresizingMaskIntoConstraints = false
        
        favoriteMovieTableView.tableFooterView = goToFavoritesSearchButton
    }
    
    func layoutFavoriteMovieTableView() {
        NSLayoutConstraint.activate([
            favoriteMovieTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5.0),
            favoriteMovieTableView.leftAnchor.constraint(equalTo:view.leftAnchor),
            favoriteMovieTableView.rightAnchor.constraint(equalTo:view.rightAnchor),
            favoriteMovieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func layoutGoToFavoritesSearchButton() {
        NSLayoutConstraint.activate([
            goToFavoritesSearchButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            goToFavoritesSearchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            goToFavoritesSearchButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.08)
            ])
    }
    
    @objc func goToFavoritesSearch(_ sender: UIButton) {
        self.navigationController?.pushViewController(MovieSearchViewController(), animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! FavoriteMovieTableViewCell
        let idx: Int = indexPath.row
        //title
        moviecell.movieTitle.text = favoriteMovies[idx].title
        //year
        moviecell.movieYear.text = favoriteMovies[idx].year
        
        // image
        displayMovieImage(idx, moviecell: moviecell)
        
        return moviecell

    }

    func displayMovieImage(_ row: Int, moviecell: FavoriteMovieTableViewCell) {
        let url: String = (URL(string: favoriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImage.image = image
            })
        }).resume()
    }

    override func viewWillAppear(_ animated: Bool) {
       // mainTableView.reloadData()
        if favoriteMovies.count == 0{
            favoriteMovies.append(Movie(id: "tt0372784", title: "Batman Begins" , year: "2005", imageUrl: "https://vignette3.wikia.nocookie.net/batman/images/b/b2/Batman-begins_15.jpg/revision/latest/scale-to-width-down/2000?cb=20160913155903" ))
        }
        super.viewWillAppear(animated)
    }

   // private var myTableView: UITableView!
    

}
