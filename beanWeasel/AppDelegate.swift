//
//  AppDelegate.swift
//  beanWeasel
//
//  Created by tbrown on 7/27/15.
//  Copyright (c) 2015 doktorbrown. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        println("Finished Launching")
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        println("Application Terminated")
    }


}

