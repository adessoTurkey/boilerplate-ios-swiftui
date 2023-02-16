//
//  AppDelegate.swift
//  boilerplate-ios-swiftui
//
//  Created by Can Baybunar on 18.11.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

// Uncomment Pulse related codes to test network debugging.
import UIKit
#if canImport(Pulse)
import Pulse
#endif

class BoilerPlateAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    lazy private var services: [UIApplicationDelegate] = [LoggingService()]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
#if DEBUG
#if canImport(Pulse)
        Experimental.URLSessionProxy.shared.isEnabled = true
        URLSessionProxyDelegate.enableAutomaticRegistration()
#endif
#endif
        // swiftlint:disable:next force_unwrapping, force_cast
        let bundle = Bundle.main.infoDictionary?["CFBundleName"] as! String
        print(bundle)
        return services.allSatisfy { service -> Bool in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
