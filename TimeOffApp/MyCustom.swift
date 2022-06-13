//
//  MyCustom.swift
//  TimeOffApp
//
//  Created by Robson Lima Lopes on 10/06/22.
//

import UIKit

class MyCustom: UIView {

    let imageView = UIImageView(frame: .zero)
    
    let label = UILabel(frame: .zero)
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        
        ])
    }
    
    required init? (coder: NSCoder){
        fatalError("error")
    }

}
