//
//  ViewController.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 5/19/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    var backgroundImage = UIImageView()
    var titleLabel = UILabel()
    var findMoviesButton = UIButton()
    var myMoviesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupBackgroundImage()
        setupTitleLabel()
        setupFindMoviesButton()
        setupMyMoviesButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutBackgroundImage()
        layoutTitleLabel()
        layoutFindMoviesButton()
        layoutMyMoviesButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func onMyMovies(_ sender: UIButton) {
        self.navigationController?.pushViewController(FavoriteMoviesViewController(), animated: true)
    }
   
    @objc func onFindMovies(_ sender: UIButton) {
        self.navigationController?.pushViewController(MovieSearchViewController(), animated: true)
    }
    
    func setupBackgroundImage() {
        backgroundImage.image = UIImage(named: "theatre")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImage)
    }
    
    func layoutBackgroundImage() {
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
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
    
    func setupFindMoviesButton() {
        findMoviesButton.setTitle("Find Movies", for: UIControlState())
        findMoviesButton.backgroundColor = UIColor.lightGray
        findMoviesButton.layer.borderColor = UIColor.white.cgColor
        findMoviesButton.layer.borderWidth = 1

        findMoviesButton.setTitleColor(.white, for: UIControlState())
        findMoviesButton.addTarget(self, action: #selector(onFindMovies), for: .touchUpInside)
        findMoviesButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(findMoviesButton)
    }
    
    func layoutFindMoviesButton() {
        NSLayoutConstraint.activate([
            findMoviesButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.4),
            findMoviesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.3),
            findMoviesButton.topAnchor.constraint(equalTo: myMoviesButton.bottomAnchor, constant: 10.0),
            findMoviesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.075)
            ])
    }
    
    func setupMyMoviesButton() {
        myMoviesButton.setTitle("My Favorite Movies", for: UIControlState())
        myMoviesButton.backgroundColor = UIColor.black
        
        myMoviesButton.layer.borderColor = UIColor.gray.cgColor
        myMoviesButton.layer.borderWidth = 1
        myMoviesButton.setTitleColor(.white, for: UIControlState())
        myMoviesButton.isEnabled = true
        myMoviesButton.addTarget(self, action: #selector(onMyMovies), for: .touchUpInside)
        myMoviesButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(myMoviesButton)
    }
    
    func layoutMyMoviesButton() {
        NSLayoutConstraint.activate([
            myMoviesButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.6),
            myMoviesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.2),
            myMoviesButton.topAnchor.constraint(equalTo: view.topAnchor, constant:UIScreen.main.bounds.height * 0.78),
            myMoviesButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.08)
            ])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
   
}
