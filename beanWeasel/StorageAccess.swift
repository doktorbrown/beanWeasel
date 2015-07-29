//
//  StorageAccess.swift
//  beanWeasel
//
//  Created by tbrown on 7/28/15.
//  Copyright (c) 2015 doktorbrown. All rights reserved.
//

import Cocoa
import Foundation


class StorageAccess: NSObject {
    
    //Read server address from managed file to get different address based on location
    func getServerAddress() ->(String) {
        let serverFile = "/Library/CLMadmin/Config/mediacommons.cfg"
        let serverFileContents = String(contentsOfFile: serverFile, encoding: NSUTF8StringEncoding, error: nil)!
        let newString = serverFileContents.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let serverAddress = newString.substringFromIndex("MC=".endIndex)
        return (serverAddress)
    }
    
    func connectToServer(){
        let errorPopup: NSAlert = NSAlert()
        errorPopup.addButtonWithTitle("Quit Application")
        errorPopup.messageText = "Cannot Connect to Server"
        errorPopup.informativeText = "Check Network Connection"
        let url = ("mount volume" + "\"" + self.getServerAddress() + "\"")
        NSLog("url = %@", url)
        var error: AutoreleasingUnsafeMutablePointer<NSDictionary?> = nil
        let createScript: NSAppleScript = NSAppleScript(source: url)!
        if var runScript = createScript.executeAndReturnError(error) {
            println("in if statement")
        }
        else{
            println("in else statement")
            errorPopup.runModal()
            NSApplication.sharedApplication().terminate(self)
        }
        println(error)
    }
   
}