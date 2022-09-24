//
//  SearchPageCellTableViewCell.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit

class SearchPageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    static let identifier = "SearchPageCellTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
