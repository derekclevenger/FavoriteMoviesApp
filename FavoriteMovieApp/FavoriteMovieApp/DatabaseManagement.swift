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
        id CHAR(255) PRIMARY KEY NOT NULL,
        title CHAR(255),
        year CHAR(4),
        imageUrl CHAR(255),
        plot CHAR(5000));
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
    
    //TODO finish crud for this to see if it works.
    func insert(movie: Movie) {
        //this isn't complete
        var insertStatement: OpaquePointer? = nil
        let insertStatementString = "INSERT INTO Movie (id = \(movie.id), Name) VALUES (?, ?);"

        // 1
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let id: Int32 = 1
            let name: NSString = "Ray"

            // 2
            sqlite3_bind_int(insertStatement, 1, id)
            // 3
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)

            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
}
