//
//  ViewController.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 5/19/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var backgroundImage = UIImageView()
    var titleLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupBackgroundImage()
        setupTitleLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutBackgroundImage()
        layoutTitleLabel()
    }
    

   
    func setupBackgroundImage() {
        backgroundImage.image = UIImage(named: "theatre")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImage)
    }
    
    func layoutBackgroundImage() {
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.8),
            backgroundImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            
            ])
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Favorite Movies App"
        titleLabel.font = UIFont(name: "ArialMT", size: 55)
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImage.addSubview(titleLabel)
    }
    
    func layoutTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.125),
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.15),
            
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
   
}
