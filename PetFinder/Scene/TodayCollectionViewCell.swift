//
//  TodayCollectionViewCell.swift
//  PetFinder
//
//  Created by 황재하 on 9/28/23.
//

import UIKit

class TodayCollectionViewCell: BaseCollectionViewCell{
    
    let imageView = UIImageView()
    
    override func configure(){
        
        contentView.addSubview(imageView)
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(named: "Title")?.cgColor
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
    }
    
    
}
