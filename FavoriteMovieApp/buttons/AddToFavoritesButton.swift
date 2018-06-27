//
//  EditCardButton.swift
//  WalletFi
//
//  Worked on by Core10
//  Copyright © 2017 WalletFi. All rights reserved.
//

import Foundation
import UIKit

class AddToFavoritesButton: UIButton {
    init() {
        super.init(frame:CGRect.zero)
        
        titleLabel?.font = Globals.FAFont(ofSize: 28.0)
        setTitle(Globals.FAIcon(withName: .plusCircle), for: UIControlState())
        setTitleColor(UIColor.lightGray, for: UIControlState())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

