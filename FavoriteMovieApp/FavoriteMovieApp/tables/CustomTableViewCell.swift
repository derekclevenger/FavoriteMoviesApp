//
//  CustomTableViewCell.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 6/12/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
        var movieImageView: UIImageView!
        var movieTitle: UILabel!
        var movieYear: UILabel!
        var favButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
