//
//  DatabaseManagement.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 6/25/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import Foundation
import SQLite3

class DatabaseManagement {
   
    var db: OpaquePointer? = nil
    var newDb: OpaquePointer? = nil
    func openDatabase() -> OpaquePointer? {
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FavoriteMovies.sqlite")
        if sqlite3_open(fileUrl.path, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(fileUrl)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            return nil
        }
        
    }

    func createTable() {
        // 1
        db = openDatabase()
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Movies(
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT,
        year TEXT,
        imageUrl TEXT);
        """
        var createTableStatement: OpaquePointer? = nil
        // 2
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Movies table created.")
            } else {
                print("Movies table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        // 4
        sqlite3_finalize(createTableStatement)
        
    }
    
    func insert(movie: Movie) {
        db = openDatabase()
       
        let id: NSString = movie.id as NSString
        let title: NSString = movie.title as NSString
        let year: NSString = movie.year as NSString
        let imageUrl: NSString = movie.imageUrl as NSString
        
        var insertStatement: OpaquePointer? = nil
        let insertStatementString = "INSERT INTO Movies (id, title, year, imageUrl) VALUES (?, ?, ?, ?);"
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            if sqlite3_bind_text(insertStatement, 1, id.utf8String, -1, nil) != SQLITE_OK {
                print("error binding id")
            }
            if sqlite3_bind_text(insertStatement, 2, title.utf8String, -1, nil) != SQLITE_OK {
                print("error binding title")
            }
            if sqlite3_bind_text(insertStatement, 3, year.utf8String, -1, nil) != SQLITE_OK {
                print("error binding year")
            }
            if sqlite3_bind_text(insertStatement, 4, imageUrl.utf8String, -1, nil) != SQLITE_OK {
                print("error binding imageUrl")
            }
            

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
                  print(insertStatementString)
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
    
       
        sqlite3_finalize(insertStatement)
    }
    
    func getAllQuery(tableName: String) -> [Movie] {
        db = openDatabase()
        var movies: [Movie] = []
        let queryStatementString = "SELECT * FROM \(tableName);"
        var queryStatement: OpaquePointer? = nil
  
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
              
            }
        
                while(sqlite3_step(queryStatement) == SQLITE_ROW){
                    let id = String(cString: sqlite3_column_text(queryStatement, 0))
                    let title = String(cString: sqlite3_column_text(queryStatement, 1))
                    let year = String(cString: sqlite3_column_text(queryStatement, 2))
                    let imageUrl = String(cString: sqlite3_column_text(queryStatement, 3))
                    
                    movies.append(Movie(id: id, title: title, year: year, imageUrl: imageUrl))
                }
        sqlite3_finalize(queryStatement)
         //print("Id \(movies[0].id), title: \(movies[0].title), year: \(movies[0].year), imageUrl: \(movies[0].imageUrl)")
        return movies
    }
    
    func delete(id: String) {
        let deleteStatementStirng = "DELETE FROM Movies WHERE id == \(id);"

        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
    }
}
    

