//
//  view.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation
import UIKit

class BackgroundView: UIView {
    //MARK: - Variable
    private var navigatitionTitle = UILabel()
    private var backButton = UIButton()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame:  frame)
    }
    
    init(title: String, buttonIsHidden: Bool) {
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 256))
        
        setupNavigationTitle(title: title)
        makeLayer()
        setupBackButton(isHidden: buttonIsHidden)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func makeLayer() {
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
                                               y: -self.frame.width/4,
                                               width: 840 ,
                                               height: 260))
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.frame = self.bounds
        
        gradientMaskLayer.mask = shapeLayer
        self.layer.insertSublayer(gradientMaskLayer, at: 0)
    }
    
    private func setupNavigationTitle(title: String) {
        self.addSubview(navigatitionTitle)
        navigatitionTitle.backgroundColor = .clear
        navigatitionTitle.text = title
        navigatitionTitle.textAlignment = .center
        navigatitionTitle.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        navigatitionTitle.textColor = .white
        
        //Constrains
        navigatitionTitle.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.center.equalTo(self.snp.center)
        }
    }
    
    private func setupBackButton(isHidden: Bool) {
        self.addSubview(backButton)
        backButton.isHidden = isHidden
        backButton.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.leading.equalTo(self.snp.leading).offset(32)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}

