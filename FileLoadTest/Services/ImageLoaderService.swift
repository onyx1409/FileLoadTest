//
//  ImageLoaderService.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit
import Parse
import ImageIO
import MobileCoreServices

class ImageLoadService {
    func uploadImage(_ image: UIImage, completion: @escaping (Result<ImageFileModel, Error>) -> Void, progress: @escaping (Float) -> Void) {
        let completeWithError: (Error) -> Void = { error in
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
        
        DispatchQueue.global().async {
            guard let data = image.jpegData(compressionQuality: 0.6) else {
                completeWithError(NSError.withLocalizedDescription("Error creating data from image"))
                return
            }
            
            let file = PFFileObject(data: data, contentType: "image/jpeg")
            file.saveInBackground({ (success, error) in
                DispatchQueue.global().async {
                    if let error = error {
                        completeWithError(error)
                        return
                    }
                    
                    let imageModel = ParseImageFile()
                    imageModel.file = file
                    
                    imageModel.saveInBackground { (success, error) in
                        if let error = error {
                            completeWithError(error)
                        }
                        
                        guard let url = file.url, let objectId = imageModel.objectId, let uploadDate = imageModel.createdAt else {
                            completeWithError(NSError.withLocalizedDescription("Error uploading file on server"))
                            return
                        }
                        
                        let imageModel = ImageFileModel(modelId: objectId, urlString: url, date: uploadDate)
                        DispatchQueue.main.async {
                            completion(.success(imageModel))
                        }
                    }
                }
                
            }) { (percent) in
                DispatchQueue.main.async {
                    progress(Float(percent)/100)
                }
            }
        }
    }
}
