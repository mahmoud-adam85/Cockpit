//
//  CCWidget.swift
//  Cockpit
//
//  Created by Tim Palade on 10/23/18.
//  Copyright © 2018 Tim Palade. All rights reserved.
//

import UIKit
import SnapKit

class CCWidget: UIView {
    var imageView: UIImageView? = nil
    var mainLabel: UILabel? = nil
    var auxLabel: UILabel? = nil
}

class CCTimeSavedWidget: CCWidget {
    
    init(image: UIImage, quanitity: Int, scale: String) {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView()
        let labelContainer = UIView()
        mainLabel = UILabel()
        auxLabel = UILabel()
        
        self.addSubview(imageView!)
        self.addSubview(labelContainer)
        labelContainer.addSubview(mainLabel!)
        labelContainer.addSubview(auxLabel!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
        
        labelContainer.snp.makeConstraints { (make) in
            make.center.equalTo(imageView!.snp.center)
            make.size.equalTo(100)
        }
        
        mainLabel!.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
        }
        
        auxLabel!.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel!.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        imageView?.image = image
        mainLabel?.text = String(quanitity)
        auxLabel?.text = scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
