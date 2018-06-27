//
//  Globals.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 6/21/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

struct Globals {
    
    static func FAFont(ofSize size: CGFloat) -> UIFont {
        return UIFont.fontAwesome(ofSize: size)
    }
    
    static func FAIcon(withName name: FontAwesome) -> String {
        return String.fontAwesomeIcon(name: name)
    }
    
    static func FAIcon(withCode code: String) -> String {
        return String.fontAwesomeIcon(code: code) ?? ""
    }
    
    static func regularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "GillSans", size: size)!
    }

}
