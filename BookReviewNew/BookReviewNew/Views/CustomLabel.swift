//
//  NameAndCategoryLabel.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    init(size: CGFloat) {
        super.init(frame: .zero)
        numberOfLines = 0
        font = UIFont(name: "AppleSDGothicNeo-Bold", size: size)
        textColor = #colorLiteral(red: 0.2209328711, green: 0.3112437129, blue: 0.4919691086, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
