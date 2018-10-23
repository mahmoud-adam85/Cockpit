//
//  ViewController.swift
//  Cockpit
//
//  Created by Tim Palade on 10/22/18.
//  Copyright © 2018 Tim Palade. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    let CCVC = CCViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CCVC.dataSource = self
        self.addChildViewController(CCVC)
        self.view.addSubview(CCVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CCDataSource {
    func numberOfRows() -> Int {
        return 10
    }
    
    func heightFor(index: Int) -> CGFloat {
        if index == 0 {
            return 300
        }
        return 100
    }
    
    func cellFor(index: Int) -> UIView {
        if index == 0 {
            let v = UIStackView()
            
            v.axis = .horizontal
            //v.spacing = 10
            v.distribution = .equalSpacing
            
            let c1 = CCVerticalCell(widgetRatio: CCUX.VerticalContentWidgetRatio, descriptionRatio: 1 - CCUX.VerticalContentWidgetRatio)
            let c2 = CCVerticalCell(widgetRatio: CCUX.VerticalContentWidgetRatio, descriptionRatio: 1 - CCUX.VerticalContentWidgetRatio)
            
            v.addArrangedSubview(c1)
            v.addArrangedSubview(c2)
            
            c1.snp.makeConstraints { (make) in
                make.width.equalToSuperview().dividedBy(2).offset(-5)
                make.height.equalToSuperview()
            }
            
            c2.snp.makeConstraints { (make) in
                make.width.equalToSuperview().dividedBy(2).offset(-5)
                make.height.equalToSuperview()
            }
            
            return v
        }
        return CCHorizontalCell(widgetRatio: CCUX.HorizontalContentWigetRatio, descriptionRatio: 1 - CCUX.HorizontalContentWigetRatio)
    }
    
    func cellSpacing() -> CGFloat {
        return 22.0
    }
    
    func horizontalPadding() -> CGFloat {
        return 20
    }
}

