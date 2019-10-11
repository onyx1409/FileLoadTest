//
//  BaseController.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var imageLoaderService: ImageLoadService!
    
    init(service: ImageLoadService) {
        super.init(nibName: nil, bundle: nil)
        self.imageLoaderService = service
    }
    
    required init?(coder: NSCoder) {
        fatalError("init:coder is not implemented")
    }
}
