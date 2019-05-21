//
//  InsetTextField.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit


class InsetTextField: UITextField {

   // 006 to manipulate place holder textfield
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    // 009 must have
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    
    
    // 007 to customise the way it looks. textRect(for bounds), editingRect(for bounds), placeholderRect(for bounds)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // 008 to set attributed placeholder
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        
        self.attributedPlaceholder = placeholder
    }
    
}
