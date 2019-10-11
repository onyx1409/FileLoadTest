//
//  Models.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 11/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import Foundation
import Parse

class ParseImageFile: PFObject, PFSubclassing {
    
    static func parseClassName() -> String {
        return "ImageFile"
    }
    
    @NSManaged var file: PFFileObject?
}
