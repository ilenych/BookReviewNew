//
//  view.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

class BackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //Gradient layeur
        let gradientMaskLayer = CAGradientLayer()
        
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.startPoint = CGPoint(x: 0.75, y: 0.25)
        gradientMaskLayer.endPoint = CGPoint(x: 0.25, y: 0.5)
        gradientMaskLayer.colors = [
          UIColor(red: 0.996, green: 0.714, blue: 0.396, alpha: 1).cgColor,
          UIColor(red: 0.965, green: 0.431, blue: 0.706, alpha: 1).cgColor
        ]
        gradientMaskLayer.locations = [0.0, 1.0]
        
        //Shape layer
        let path = UIBezierPath(ovalIn: CGRect(x: -420+self.frame.width/2,
                                               y: -self.frame.width/6,
                                               width: 840 ,
                                               height: 260))
        
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.frame = self.bounds
        
        gradientMaskLayer.mask = shapeLayer
        self.layer.insertSublayer(gradientMaskLayer, at: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

