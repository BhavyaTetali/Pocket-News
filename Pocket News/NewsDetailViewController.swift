//
//  NewsDetailViewController.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var currNewsItem = News()
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var article: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTitle.text = currNewsItem.title
        author.text = currNewsItem.author
        img.image = currNewsItem.newsImage
        article.text = currNewsItem.description
        
    }
    /*
    override func viewDidLayoutSubviews() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.yellow.cgColor, UIColor.green.cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.insertSublayer(layer, at:0)
    }*/
    
}
