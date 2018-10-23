//
//  CCAbstractCell.swift
//  Cockpit
//
//  Created by Tim Palade on 10/22/18.
//  Copyright © 2018 Tim Palade. All rights reserved.
//

import UIKit
import SnapKit

struct CCCellUX {
    static let CornerRadius: CGFloat = 20.0
    static let ShadowColor: CGColor = UIColor.blue.cgColor
    static let ShadowRadius: CGFloat = 4.0
    static let ShadowOpacity: Float = 0.9
}

class CCAbstractCell: UIView {

    var titleLabel: UILabel = UILabel()
    var descriptionLabel: UILabel = UILabel()
    private var _widget: CCWidget? = nil
    var widget: CCWidget? {
        get {
            return _widget
        }
        set {
            _widget?.removeFromSuperview()
            _widget = newValue
            if let w = _widget {
                widgetContainer.addSubview(w)
                w.snp.makeConstraints({ (make) in
                    make.edges.equalToSuperview()
                })
            }
        }
    }
    
    let contentView = UIView()
    let stackView = UIStackView()
    let widgetContainer = UIView()
    let descriptionContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(widgetContainer)
        stackView.addArrangedSubview(descriptionContainer)
        descriptionContainer.addSubview(titleLabel)
        descriptionContainer.addSubview(descriptionLabel)
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.backgroundColor = .clear
        self.layer.shadowColor = CCCellUX.ShadowColor
        self.layer.shadowRadius = CCCellUX.ShadowRadius
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = CCCellUX.ShadowOpacity
        self.layer.cornerRadius = CCCellUX.CornerRadius
        self.clipsToBounds = false
        
        self.contentView.layer.cornerRadius = CCCellUX.CornerRadius
        self.contentView.clipsToBounds = true
        
//        titleLabel.text = "Some Very Long Title"
//        descriptionLabel.text = "Some very long description just to see how this stuff behaves, muahahaha, evil laugh."
        
        descriptionLabel.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCVerticalCell: CCAbstractCell {
    
    //widgetRatio is the height of the widget over the height of the cell
    //descrRatio is the height of the description over the height of the cell
    init(widgetRatio: CGFloat, descriptionRatio: CGFloat) {
        super.init(frame: CGRect.zero)
        
        stackView.axis = .vertical
        
        widgetContainer.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(widgetRatio)
        }
        
        descriptionContainer.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(descriptionRatio)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        widgetContainer.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        descriptionContainer.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        fatalError("ratios is not specified")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCHorizontalCell: CCAbstractCell {
    
    //widgetRatio is the width of the widget over the height of the cell
    //descrRatio is the width of the description over the height of the cell
    init(widgetRatio: CGFloat, descriptionRatio: CGFloat) {
        super.init(frame: CGRect.zero)
        
        stackView.axis = .horizontal
        
        widgetContainer.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(widgetRatio)
        }
        
        descriptionContainer.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(descriptionRatio)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        widgetContainer.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        descriptionContainer.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        fatalError("ratios is not specified")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
