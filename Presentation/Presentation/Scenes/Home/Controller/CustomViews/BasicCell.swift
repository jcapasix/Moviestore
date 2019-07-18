//
//  BasicCell.swift
//  Presentation
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class BasicCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    var indicatorView: UIView!
    
    override var isSelected: Bool {
        
        didSet{
            UIView.animate(withDuration: 0.30) {
                self.indicatorView.backgroundColor = self.isSelected ? UIColor.colorFromHex(APP_COLOR) : UIColor.clear
                self.indicatorView.layer.masksToBounds = true
                self.indicatorView.layer.cornerRadius = 1
                self.layoutIfNeeded()
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: titleLabel)
        addConstraintsWithFormatString(formate: "V:|[v0]|", views: titleLabel)
        
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        setupIndicatorView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
    func setupIndicatorView() {
        indicatorView = UIView()
        addSubview(indicatorView)
        
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: indicatorView)
        addConstraintsWithFormatString(formate: "V:[v0(3)]|", views: indicatorView)
    }
    
}
