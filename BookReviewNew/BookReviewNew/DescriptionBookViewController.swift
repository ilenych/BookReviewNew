//
//  DescriptionBookViewController.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import Cosmos

class DescriptionBookViewController: UIViewController {
    //MARK: - Variable
    private var bgView = BackgroundView(title: "Book Review", buttonIsHidden: false)
    private var nameLabeel = CustomLabel(size: 20)
    private var categoryLabel = CustomLabel(size: 14)
    private var descriptionLabel = CustomLabel(size: 14)
    private var ratings: CosmosView = {
        let ratings = CosmosView()
        ratings.settings.starSize = 25.0
        ratings.settings.filledColor = #colorLiteral(red: 1, green: 0.8543232679, blue: 0.5309451222, alpha: 1)
        ratings.settings.filledBorderColor = #colorLiteral(red: 1, green: 0.8543232679, blue: 0.5309451222, alpha: 1)
        ratings.settings.emptyColor = .lightGray
        ratings.settings.emptyBorderColor = .lightGray
        ratings.settings.fillMode = .half
        return ratings
    }()
    private var coverBookImage: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 10
        i.clipsToBounds = true
        return i
    }()
    
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
        setupRetings()
        
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
            make.top.equalTo(coverBookImage.snp.top).offset(50)
        }
    }
    
    fileprivate func setupCategoryLabel() {
        view.addSubview(categoryLabel)
        categoryLabel.text = book.category
        categoryLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.top.equalTo(nameLabeel.snp.bottom).offset(10)
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
    
    fileprivate func setupRetings() {
        view.addSubview(ratings)
        ratings.snp.makeConstraints { (make) in
            make.bottom.equalTo(coverBookImage.snp.bottom).offset(-10)
            make.leading.equalTo(coverBookImage.snp.trailing).offset(14)
            make.width.equalTo(160)
            make.height.equalTo(25)
        }
    }
}
