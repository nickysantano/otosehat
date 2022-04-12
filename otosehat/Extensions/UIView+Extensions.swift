//
//  File.swift
//  otosehat
//
//  Created by Nicky Santano on 04/04/22.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
