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
    
    init(quanitity: Int, scale: String) {
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
            make.size.equalTo(70)
        }
        
        mainLabel!.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        auxLabel!.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel!.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        imageView?.image = UIImage(named: "CCCircle")
        mainLabel?.text = String(quanitity)
        auxLabel?.text = scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCAdsBlockedWidget: CCWidget {
    
    init(quanitity: Int) {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView()
        mainLabel = UILabel()
        
        self.addSubview(imageView!)
        self.addSubview(mainLabel!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
        
        mainLabel!.snp.makeConstraints { (make) in
            make.center.equalTo(imageView!.snp.center)
        }
        
        imageView?.image = UIImage(named: "CCAdBlocking")
        mainLabel?.text = String(quanitity)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
