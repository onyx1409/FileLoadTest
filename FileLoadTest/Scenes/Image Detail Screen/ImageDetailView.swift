//
//  ImageDetailView.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ImageDetailView: UIView {
    
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
        
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        addSubview(imageIdLabel)
        imageIdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(6)
            make.trailing.equalToSuperview().inset(8)
        }
    }
    
    //MARK: - Views
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        return image
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    var imageIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    //MARK: - Utilites
    
    func setWithModel(_ model: ImageFileModel) {
        if let url = URL(string: model.urlString) {
            imageView.kf.setImage(with: url, options: [.progressiveJPEG(.default)])
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .medium
        
        dateLabel.text = formatter.string(from: model.date)
        imageIdLabel.text = "File ID - \(model.modelId)"
    }

}
