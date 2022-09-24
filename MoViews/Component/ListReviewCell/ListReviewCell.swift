//
//  ListReviewCell.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import UIKit

class ListReviewCell: UITableViewCell {

    @IBOutlet weak var imageAva: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCreatedDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    static let identifier = "ListReviewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageAva.image = UIImage(named: "ava")
        lblName.text = ""
        lblRating.text = ""
        lblCreatedDate.text = ""
        lblContent.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
