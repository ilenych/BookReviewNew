//
//  ViewController.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    fileprivate lazy var bgView: BackgroundView = {
        let bg = BackgroundView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 256))
        bg.backgroundColor = .red
        return bg
    }()
    
    fileprivate var button: MainButton = {
        let b = MainButton(title: "Ooop")
        b.frame = CGRect(x: 40, y: 400, width: 300, height: 100)
        b.setGradientLayer()
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setubButton()
    }
    //MARK: - Setups
    fileprivate func setupBackgroundView() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(256)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    fileprivate func setubButton() {
        view.addSubview(button)
    }
}
//MARK: - Canvas

import SwiftUI

struct SigninPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SigninPreviews.ContainerView>) -> UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: SigninPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SigninPreviews.ContainerView>) {
            
        }
    }
}

