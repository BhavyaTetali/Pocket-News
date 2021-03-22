//
//  NewsTableViewCell.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var contentViewTC: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // background changes for card view
        backgroundCard.backgroundColor = UIColor.white
        backgroundCard.layer.cornerRadius = 8.0
        
        backgroundCard.layer.masksToBounds = false
        
        // shadow
        backgroundCard.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        // shadow offset to evenly spread shadow across the card
        backgroundCard.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCard.layer.shadowOpacity = 0.8
        
        
        // can improve
        contentViewTC.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
