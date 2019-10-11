//
//  StartScreenView.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit
import SnapKit

class StartScreenView: UIView {
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        addSubview(pickerButton)
        pickerButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - Views
    
    var pickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pick Image", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 18)
        button.tintColor = UIColor.appColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor.cgColor
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pickerButton.layer.cornerRadius = pickerButton.bounds.height/2
    }

}
