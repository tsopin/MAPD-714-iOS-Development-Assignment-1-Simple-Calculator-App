//
//  roundButton.swift
//  Timofei Sopin
//  Student ID 300965775
//  Created 2017-09-20
//  MAPD2017-TimofeiSopin-Assign_1_Simple_Calculator
//  Ver. 1.0.0
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
/*
 // Only override draw() if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 override func draw(_ rect: CGRect) {
 // Drawing code
 }
 */


