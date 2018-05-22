//
//  ViewController.swift
//  FavoriteMovieApp
//
//  Created by Derek Clevenger on 5/19/18.
//  Copyright © 2018 Derek Clevenger. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var topLabel = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
    func setupSubviews(){
        setupTopLabel()
    }
    
    func layoutSubviews(){
        layoutTopLabel()
    }

    private func setupTopLabel() {
        topLabel.backgroundColor = UIColor.blue
        topLabel.translatesAutoresizingMaskIntoConstraints = false
       self.view.addSubview(topLabel)
    }
    
    private func layoutTopLabel() {
        NSLayoutConstraint.activate([
            topLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            topLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            ])
}
    
   
}
