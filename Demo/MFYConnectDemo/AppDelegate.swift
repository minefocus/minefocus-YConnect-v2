//
//  AppDelegate.swift
//  MFYConnectDemo
//
//  Created by madao23 on 2018/11/14.
//  Copyright © 2018 SCSK Corporation. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if let scheme = url.scheme {
            switch scheme {
            case AppKeys.Yahoo.appUrl:
                AuthSDKHelper.share.yahooAuth(url: url)
            default:
                break
            }
        }
        return true
    }

}

