//
//  CornerView.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

@IBDesignable
class CornerView: UIView {
    var maskedArray : CACornerMask = []
    
    @IBInspectable var c_borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = c_borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0,height: 0) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var c_shadowColor: UIColor = UIColor.black {
        didSet {
            self.layer.shadowColor = c_shadowColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            setUpView()
        }
    }
    
    @IBInspectable var cornerRadius_Pad: CGFloat = 0.0 {
        didSet {
            setUpView()
        }
    }
    
    @IBInspectable var Mask_LT: Bool = true {
        didSet {
            if Mask_LT {
                maskedArray.insert(.layerMinXMinYCorner)
            } else {
                maskedArray.remove(.layerMinXMinYCorner)
            }
            setUpView()
        }
    }
    
    @IBInspectable var Mask_LB: Bool = true {
        didSet {
            if Mask_LB {
                maskedArray.insert(.layerMinXMaxYCorner)
            } else {
                maskedArray.remove(.layerMinXMaxYCorner)
            }
            setUpView()
        }
    }
    
    @IBInspectable var Mask_RT: Bool = true {
        didSet {
            if Mask_RT {
                maskedArray.insert(.layerMaxXMinYCorner)
            } else {
                maskedArray.remove(.layerMaxXMinYCorner)
            }
            setUpView()
        }
    }
    
    @IBInspectable var Mask_RB: Bool = true {
        didSet {
            if Mask_RB {
                maskedArray.insert(.layerMaxXMaxYCorner)
            } else {
                maskedArray.remove(.layerMaxXMaxYCorner)
            }
            setUpView()
        }
    }
    
    func setUpView () {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            self.layer.cornerRadius = cornerRadius_Pad
        } else {
            self.layer.cornerRadius = cornerRadius
        }
        self.layer.maskedCorners = maskedArray
    }
}

