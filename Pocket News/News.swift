//
//  News.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import Foundation
import UIKit

class News{
    var title = ""
    var author = ""
    var description = ""
    var category = ""
    var newsImage: UIImage = UIImage()
    init(){}
    init(title: String, author: String, description: String, imagePath: String) {
        self.title = title
        self.author = author
        self.description = description
        self.category = ""
        self.newsImage = UIImage(named: imagePath)!
    }
    
}
