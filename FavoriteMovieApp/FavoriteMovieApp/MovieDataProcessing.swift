//
//  MovieDataProcessing.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 5/19/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

class MovieDataProcessing{
    static func mapJsonToMovies(object: [String: AnyObject], moviesKey: String) -> [Movie]{
        var mappedMovie: [Movie] = []
        
        guard let movies = object[moviesKey] as? [[String: AnyObject ]] else {return mappedMovie}
        
        for movie in movies {
            guard let id = movie["imdbID"] as? String,
                let name = movie["Title"] as? String,
                let year = movie["Year"] as? String,
                let imageUrl = movie["Poster"] as? String else {continue}
            
            let movieClass = Movie(id: id, title: name, year: year, imageUrl: imageUrl)
            mappedMovie.append(movieClass)
        }
        return mappedMovie
    }
    static func write(movies: [Movie]){
        //TODO: Implement :
    }
}
