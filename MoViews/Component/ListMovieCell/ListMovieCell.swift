//
//  ListMovieCell.swift
//  MoViews
//
//  Created by Faza Azizi on 16/09/22.
//

import UIKit

class ListMovieCell: UITableViewCell {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    static let identifier = "ListMovieCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImg.image = nil
        titleLbl.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
