//
//  MovieCollectionViewCell.swift
//  Presentation
//
//  Created by Jordan Capa on 7/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initView()
    }
    
    func initView(){
        self.posterImageView.layer.masksToBounds = true
        self.posterImageView.layer.cornerRadius = 10
    }

}
