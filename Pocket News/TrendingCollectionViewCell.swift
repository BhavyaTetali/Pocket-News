//
//  TrendingCollectionViewCell.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var trendingImg: UIImageView!
    @IBOutlet weak var trendingTitle: UILabel!
    
    @IBOutlet weak var backgroundCardCV: UIView!
    @IBOutlet weak var contentViewCV: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // background changes for card view
        backgroundCardCV.backgroundColor = UIColor.white
        backgroundCardCV.layer.cornerRadius = 8.0
        
        backgroundCardCV.layer.masksToBounds = false
        
        // shadow
        backgroundCardCV.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        // shadow offset to evenly spread shadow across the card
        backgroundCardCV.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCardCV.layer.shadowOpacity = 0.8
        
        
        // can improve
        contentViewCV.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
    }
    
    
    
}
