//
//  ImageDetailScreen.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit

class ImageDetailViewController: BaseController {
    
    var imageDetailView: ImageDetailView!
    
    var imageModel: ImageFileModel? {
        didSet {
            updateViewWithModel()
        }
    }
    
    override func loadView() {
        imageDetailView = ImageDetailView()
        self.view = imageDetailView
        updateViewWithModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewWithModel()
    }
    
    private func updateViewWithModel() {
        guard view != nil else { return }
        if let model = imageModel {
            imageDetailView.setWithModel(model)
        }
    }
}
