//
//  NSErrorConvenience.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import Foundation

extension NSError {
    static func withLocalizedDescription(_ description: String) -> Error {
        let error = NSError(domain: "Error", code: 1000, userInfo: [
            NSLocalizedDescriptionKey: description
            ])
        return error
    }
}
