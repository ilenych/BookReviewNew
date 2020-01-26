//
//  DescriptionBookViewController.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class DescriptionBookViewController: UIViewController {
    //MARK: - Variable
    private var bgView = BackgroundView(title: "Book Revieew", buttonIsHidden: false)
    private var nameLabeel = UILabel()
    private var categoryLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var coverBookImage = UIImageView()
    
    var book: Books?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupBackgroundView()
        setupCoverBookImage()
        setupNameLabel()
        setupCategoryLabel()
        setupDescriptionLabel()
        nameLabeel.text = book?.name // check work didSelectRowAt
    }
    //MARK: - Setups
    fileprivate func setupBackgroundView() {
        view.addSubview(bgView)
        bgView.backgroundColor = .red
        bgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(175)                           
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
    }
    
    fileprivate func setupCoverBookImage() {
        view.addSubview(coverBookImage)
        coverBookImage.backgroundColor = .green
        coverBookImage.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(200)
            make.top.equalTo(bgView.snp.bottom).offset(-48)
            make.leading.equalTo(32)
        }
    }
    
    fileprivate func setupNameLabel() {
        view.addSubview(nameLabeel)
        nameLabeel.text = "poooooop"
        nameLabeel.backgroundColor = .red
        nameLabeel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(20)
            make.bottom.equalTo(coverBookImage.snp.centerY)
        }
    }
    
    fileprivate func setupCategoryLabel() {
        view.addSubview(categoryLabel)
        categoryLabel.text = "opppppp"
        categoryLabel.backgroundColor = .blue
        categoryLabel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(20)
            make.top.equalTo(coverBookImage.snp.centerY)
        }
    }
    
    fileprivate func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "omg"
        descriptionLabel.backgroundColor = .brown
        descriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(32)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.top.equalTo(coverBookImage.snp.bottom).offset(50)
        }
    }
        
}

//MARK: - Canvas

import SwiftUI

struct DescriptionBookPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<DescriptionBookPreviews.ContainerView>) -> UIViewController {
            return DescriptionBookViewController()
        }
        
        func updateUIViewController(_ uiViewController: DescriptionBookPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<DescriptionBookPreviews.ContainerView>) {
            
        }
    }
}
