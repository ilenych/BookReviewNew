//
//  TableViewCell.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var coverBookImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    static let reuseId = "TableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        //setup bgView
        bgView.layer.shadowColor = #colorLiteral(red: 0.2209328711, green: 0.3112437129, blue: 0.4919691086, alpha: 1).cgColor
        bgView.layer.shadowRadius = 4
        bgView.layer.shadowOpacity = 0.2
        bgView.layer.shadowOffset = CGSize(width: 8, height: 8)
        bgView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
