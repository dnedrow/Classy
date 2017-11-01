//
//  AppDelegate.swift
//  ExampleSwift
//
//  Created by David Nedrow on 10/23/17.
//  Copyright © 2017 Classy. All rights reserved.
//

import UIKit
import Classy

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Fire up classy. We don't have any app extensions, so we can use UIApplication.shared.windows
        CASStyler.bootstrapClassy(withTargetWindows: UIApplication.shared.windows)

        // Set up UIButton to handle control states and setBackgroundColor extension provided by UIButton+PLColor
        let buttonClassDescriptor = CASStyler.default().objectClassDescriptor(for: UIButton.self)
        let colorArg = CASArgumentDescriptor.arg(with: UIColor.self)
        let controlStateMap: [String:UIControlState] = [
            "normal"        : UIControlState.normal,
            "highlighted"   : UIControlState.highlighted,
            "disabled"      : UIControlState.disabled,
            "selected"      : UIControlState.selected,
            "focused"       : UIControlState.focused,
            "pressed"       : [UIControlState.selected, UIControlState.highlighted]
        ]
        let stateArg = CASArgumentDescriptor.arg(withName: "state", valuesByName: controlStateMap)
        // Tie it all together for UIButton
//        buttonClassDescriptor?.setArgumentDescriptors([colorArg!, stateArg!], setter: #selector(UIButton.setBackgroundColor(_:for:)), forPropertyKey: "backgroundColor")
//        buttonClassDescriptor?.setArgumentDescriptors([colorArg as Any, stateArg as Any], setter: #selector(UIButton.setBackgroundColor(_:forState:)), forPropertyKey: "backgroundColor")
//        buttonClassDescriptor?.setArgumentDescriptors([colorArg as Any, stateArg as Any], setter: #selector(UIButton.setBackgroundColor(_:forState:)), forPropertyKey: "backgroundColor")
//        buttonClassDescriptor?.setArgumentDescriptors([colorArg as Any, stateArg as Any], setter: #selector(UIButton.setBackgroundColor(withColor:forState:)), forPropertyKey: "backgroundColor")
        buttonClassDescriptor?.setArgumentDescriptors([colorArg as Any, stateArg as Any], setter: #selector(UIButton.setBackgroundColor(color:state:)), forPropertyKey: "backgroundColor")
        
//        buttonClassDescriptor?.setArgumentDescriptors([colorArg as Any, stateArg as Any], setter: #selector(UIButton.setBackgroundColorWithColor(_:state:)), forPropertyKey: "backgroundColor")
        
#if TARGET_IPHONE_SIMULATOR
        // Set up live reload
        var absoluteFilePath: String = CASAbsoluteFilePath("Styles/stylesheet.cas")
        CASStyler.default().watchFilePath = absoluteFilePath
#endif

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

