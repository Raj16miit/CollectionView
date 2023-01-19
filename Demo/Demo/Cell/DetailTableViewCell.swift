//
//  DetailTableViewCell.swift
//  Demo
//
//  Created by Rajkumar on 19/01/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var imgView:UIImageView?
    @IBOutlet var nameLbl:UILabel?
    @IBOutlet var detailLbl:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView?.layer.masksToBounds = false
        imgView?.layer.borderColor = UIColor.black.cgColor
        imgView?.layer.cornerRadius = (imgView?.frame.height ?? 0)/2
        imgView?.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
