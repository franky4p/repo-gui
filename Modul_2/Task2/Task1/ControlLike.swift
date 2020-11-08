//
//  ControlLike.swift
//  Task1
//
//  Created by macbook on 08.11.2020.
//

import UIKit

class ControlLike: UIControl {

    var isLiked: Bool = false
    var counterLike: Int = 0
    let imageHeart = UIImageView(image: UIImage(named: "heart"))
    var labelLike = UILabel()
    
    
    override var isSelected: Bool {
        didSet {
            self.isLiked = !self.isLiked
            updateLikeColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.imageHeart)
        
        let constrY = self.imageHeart.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let constrX = self.imageHeart.centerXAnchor.constraint(equalTo: self.leftAnchor)
        
        constrY.isActive = true
        constrX.isActive = true
        
        let width = self.imageHeart.widthAnchor.constraint(equalTo: self.widthAnchor)
        let height = self.imageHeart.heightAnchor.constraint(equalTo: self.heightAnchor)
        
        width.isActive = true
        height.isActive = true
        
        self.addSubview(self.labelLike)
        self.labelLike.translatesAutoresizingMaskIntoConstraints = false
        
        let labelConstrY = self.labelLike.centerYAnchor.constraint(equalTo: self.imageHeart.centerYAnchor)
        let labelConstrX = self.labelLike.centerXAnchor.constraint(equalTo: self.imageHeart.centerXAnchor)
        
        labelConstrY.isActive = true
        labelConstrX.isActive = true
        
        self.labelLike.text = "\(self.counterLike)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLikeColor(){
        if isLiked {
            imageHeart.tintColor = UIColor.red
            print("Поставлен лайк")
        } else {
            imageHeart.tintColor = UIColor.gray
            print("Лайк забрали")
        }
        
        self.labelLike.text = "\(self.counterLike)"
    }
}
