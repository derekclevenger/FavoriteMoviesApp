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
        db = openDatabase()
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Movies(
        id TEXT Not Null,
        title TEXT,
        year TEXT,
        imageUrl TEXT);
        """
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Movies table created.")
            } else {
                print("Movies table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        sqlite3_close(db)
    }
    
    func insert(movie: Movie) {
        db = openDatabase()
       
        let id = prepare(stringToInsert: movie.id)
        let title = prepare(stringToInsert: movie.title)
        let year = prepare(stringToInsert: movie.year)
        let imageUrl = prepare(stringToInsert: movie.imageUrl)
        
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
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
    
        sqlite3_finalize(insertStatement)
        sqlite3_close(db)
    }
    
    func prepare(stringToInsert: String) -> NSString {
        return stringToInsert as NSString
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
        sqlite3_close(db)
        return movies
    }
    
    func delete(id: String) {

        db = openDatabase()
        let deleteStatementString = "DELETE FROM Movies WHERE id = '\(id)';"

        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
        sqlite3_close(db)
    }
}
    

