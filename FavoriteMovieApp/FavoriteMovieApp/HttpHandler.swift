//
//  HttpHandler.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 5/19/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import Foundation

class HTTPHandler{
    static func getJson(urlString: String, completionHandler: @escaping (Data?) -> (Void)){
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        
        print("URL being used is \(url!)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){data, response, error in
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                print("request completed with code \(statusCode)")
                if(statusCode == 200){
                    print("return to completion handler with data")
                    completionHandler(data as Data)
                }
            }else if let error = error {
                print("*** There was an error making the request ***")
                print(error.localizedDescription)
                completionHandler(nil)
                
            }
            
        }
        task.resume()
    }
}
