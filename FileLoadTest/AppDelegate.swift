//
//  AppDelegate.swift
//  FileLoadTest
//
//  Created by EVGENY Oborin on 10/10/2019.
//  Copyright © 2019 EVGENY Oborin. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var imageLoaderService: ImageLoadService {
        let service = ImageLoadService()
        return service
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupParse()
        setupRootView()
        
        return true
    }
    
}

//MARK: - Initialization

extension AppDelegate {
    
    func setupParse() {
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "myAppId"
            $0.server = "https://fadi-parse-server.herokuapp.com/parse"
        }
        Parse.initialize(with: parseConfig)
        
        ParseModelUtils.registerAllSubclasses()
    }
    
    func setupRootView () {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let startVC = StartScreenViewController(service: appDelegate.imageLoaderService)
        let navVC = UINavigationController(rootViewController: startVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
