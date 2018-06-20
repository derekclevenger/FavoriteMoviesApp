//
//  CustomTableViewCell.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 6/12/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import UIKit

import UIKit

class CustomTableViewCell: UITableViewCell {
    

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(movieImage)
        containerView.addSubview(movieTitle)
        containerView.addSubview(movieYear)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(favButton)
        
        movieImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant:80).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.movieImage.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:90).isActive = true
        
        movieTitle.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true


        movieYear.topAnchor.constraint(equalTo:self.movieTitle.bottomAnchor, constant: 5.0).isActive = true
        movieYear.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        //movieYear.topAnchor.constraint(equalTo:self.movieTitle.bottomAnchor).isActive = true
        movieYear.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true


        favButton.widthAnchor.constraint(equalToConstant:60).isActive = true
        favButton.heightAnchor.constraint(equalToConstant:36).isActive = true
        favButton.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        favButton.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        favButton.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5.0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    let movieImage : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false 
        img.clipsToBounds = true
        return img
    }()
    
    let movieTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
       
        return label
    }()
    
    let movieYear:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let favButton:UIButton = {
        let favButton = UIButton()
        favButton.backgroundColor = UIColor.lightGray
        favButton.setTitle("fav", for: UIControlState())
        favButton.layer.borderColor = UIColor.gray.cgColor
        favButton.layer.borderWidth = 1
        favButton.setTitleColor(.white, for: UIControlState())
        favButton.isEnabled = true

        favButton.translatesAutoresizingMaskIntoConstraints = false
        return favButton
    }()
    
  
    
}
