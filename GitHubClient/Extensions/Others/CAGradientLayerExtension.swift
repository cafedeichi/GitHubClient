//
//  CAGradientLayer.swift
//  Rhizome
//
//  Created by ichi on 2015/07/28.
//  Copyright © 2017年 Rhzome Inc. All rights reserved.
//
import UIKit

extension CAGradientLayer {
    
    func set(frame: CGRect, topColor: UIColor, bottomColor: UIColor) {
        self.frame = frame
        self.colors = [topColor.cgColor, bottomColor.cgColor]
    }
    
}
