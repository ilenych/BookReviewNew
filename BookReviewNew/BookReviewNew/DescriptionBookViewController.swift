//
//  DescriptionBookViewController.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class DescriptionBookViewController: UIViewController {
    //MARK: - Variable
    private var bgView = BackgroundView(title: "Book Review", buttonIsHidden: false)
    private var nameLabeel = CustomLabel(size: 20)
    private var categoryLabel = CustomLabel(size: 14)
    private var descriptionLabel = CustomLabel(size: 14)
    private var coverBookImage = UIImageView()
    
    var book: Books!

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // view
        view.backgroundColor = #colorLiteral(red: 0.9622965455, green: 0.9557910562, blue: 0.9996973872, alpha: 1)
        // setups
        setupBackgroundView()
        setupCoverBookImage()
        setupNameLabel()
        setupCategoryLabel()
        setupDescriptionLabel()
        
        // target
        bgView.backButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
    }
    
    //MARK: - Function
    @objc func backView() {
          dismiss(animated: true, completion: nil)
      }
    
    //MARK: - Setups
    fileprivate func setupBackgroundView() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(175)                           
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
    }
    
    fileprivate func setupCoverBookImage() {
        view.addSubview(coverBookImage)
        coverBookImage.layer.cornerRadius = 10
        coverBookImage.clipsToBounds = true
        coverBookImage.image = UIImage(named: book.image)
        coverBookImage.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(200)
            make.top.equalTo(bgView.snp.bottom).offset(-48)
            make.leading.equalTo(32)
        }
    }
    
    fileprivate func setupNameLabel() {
        view.addSubview(nameLabeel)
        nameLabeel.text = book.name
        nameLabeel.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(15)
            make.bottom.equalTo(coverBookImage.snp.centerY)
        }
    }
    
    fileprivate func setupCategoryLabel() {
        view.addSubview(categoryLabel)
        categoryLabel.text = book.category
        categoryLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.top.equalTo(coverBookImage.snp.centerY).offset(5)
        }
    }
    
    fileprivate func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = book.description
        descriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(32)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.top.equalTo(coverBookImage.snp.bottom).offset(20)
            make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(-10)
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
