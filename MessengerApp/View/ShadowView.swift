//
//  ShadowView.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    // 011 don't forget awakeFromNib
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    
    
    // 010 to manipulate with shadow
    func setupView() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
