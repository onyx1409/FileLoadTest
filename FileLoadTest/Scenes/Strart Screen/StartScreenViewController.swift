//
//  StartScreenViewController.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit
import Closures
import SVProgressHUD

class StartScreenViewController: BaseController {
    
    var startView: StartScreenView!
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    override func loadView() {
        startView = StartScreenView()
        self.view = startView
    }
    
    private func setupActions() {
        startView.pickerButton.onTap { [unowned self] in
            self.openPicker()
        }
    }
    
    //MARK: - Utilites
    
    private func openPicker() {
        UIImagePickerController(source: .photoLibrary, allow: .image) { [unowned self] result, picker in
            guard let image = result.originalImage else { return }
            self.uploadImageWithProgress(image)
        }.present(from: self)
    }
    
    private func uploadImageWithProgress(_ image: UIImage) {
        SVProgressHUD.setDefaultMaskType(.black)
        let progressStatusString = "Uploading image"
        SVProgressHUD.showProgress(0, status: progressStatusString)
        
        self.imageLoaderService.uploadImage(image, completion: { [weak self] (result) in
            SVProgressHUD.dismiss()
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                SVProgressHUD.showError(withStatus: error.localizedDescription)
            case .success(let model):
                self.pushToImageDetail(model)
            }
        }) { (progress) in
            SVProgressHUD.showProgress(progress, status: progressStatusString)
        }
    }
    
    //MARK: - Navigation
    
    private func pushToImageDetail(_ model: ImageFileModel) {
        let imageDetailVC = ImageDetailViewController(service: imageLoaderService)
        imageDetailVC.imageModel = model
        
        navigationController?.pushViewController(imageDetailVC, animated: true)
    }
}
