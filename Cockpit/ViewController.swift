//
//  ViewController.swift
//  Cockpit
//
//  Created by Tim Palade on 10/22/18.
//  Copyright © 2018 Tim Palade. All rights reserved.
//

import UIKit
import SnapKit

extension Array {
    func isValid(index: Int) -> Bool {
        return index >= 0 && index < self.count
    }
}

protocol CCDataSourceProtocol {
    func titleFor(index: Int) -> String
    func descriptionFor(index: Int) -> String
    func widgetFor(index: Int) -> CCWidget
    func numberOfCells() -> Int
}

class CCDataSource {
    
    //struct and mapping
    //struct for cell
    //map: i -> cell struct
    
    struct CCCell {
        let title: String
        let description: String
        let widget: CCWidget
    }
    
    var cells: [CCCell] = []
    
    init() {
        //create the cells here
        let timeSaved = CCCell(title: "Time Saved", description: "that you can spend with your friends", widget: CCWidget())
        let adsBlocked = CCCell(title: "AdsBlocked", description: "so that you can enjoy surfing without ads", widget: CCWidget())
        let dataSaved = CCCell(title: "Data Saved", description: "enough for another video", widget: CCWidget())
        let batterySaved = CCCell(title: "Battery Saved", description: "so that you can enjoy your phone a little longer", widget: CCWidget())
        let phishingProtection = CCCell(title: "Phishing protection", description: "so that you can swim freely", widget: CCWidget())
        
        cells = [timeSaved, adsBlocked, dataSaved, batterySaved, phishingProtection]
    }
    
    func configureCell(cell: CCAbstractCell, index: Int) {
        cell.descriptionLabel.text = self.descriptionFor(index: index)
        cell.titleLabel.text = self.titleFor(index: index)
        cell.widget = self.widgetFor(index: index)
    }
}

extension CCDataSource: CCDataSourceProtocol {
    func titleFor(index: Int) -> String {
        guard cells.isValid(index: index) else {
            return ""
        }
        return cells[index].title
    }
    
    func descriptionFor(index: Int) -> String {
        guard cells.isValid(index: index) else {
            return ""
        }
        return cells[index].description
    }
    
    func widgetFor(index: Int) -> CCWidget {
        guard cells.isValid(index: index) else {
            return CCWidget()
        }
        return cells[index].widget
    }
    
    func numberOfCells() -> Int {
        return cells.count
    }
}


class ViewController: UIViewController {
    
    let CCVC = CCCollectionViewController()
    
    let cellDataSource = CCDataSource()
    
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

extension ViewController: CCCollectionDataSourceProtocol {
    func numberOfRows() -> Int {
        return cellDataSource.numberOfCells() - 1
    }
    
    func heightFor(index: Int) -> CGFloat {
        if index == 0 {
            return 300
        }
        return 144
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
            
            cellDataSource.configureCell(cell: c1, index: 0)
            cellDataSource.configureCell(cell: c2, index: 1)
            
            return v
        }
        
        let cell = CCHorizontalCell(widgetRatio: CCUX.HorizontalContentWigetRatio, descriptionRatio: 1 - CCUX.HorizontalContentWigetRatio)
        cellDataSource.configureCell(cell: cell, index: index + 1)
        
        return cell
    }
    
    func cellSpacing() -> CGFloat {
        return 22.0
    }
    
    func horizontalPadding() -> CGFloat {
        return 20
    }
}

