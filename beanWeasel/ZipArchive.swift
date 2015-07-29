//
//  ZipArchive.swift
//  beanWeasel
//
//  Created by tbrown on 7/28/15.
//  Copyright (c) 2015 doktorbrown. All rights reserved.
//


import Cocoa
import Foundation


class ZipArchive: NSObject {
    
    //use this to create the Zip Archive of the file to be backed up 
    func makeArchive(){
        //contents of error modal window
        let errorPopup: NSAlert = NSAlert()
        errorPopup.addButtonWithTitle("Quit Application")
        errorPopup.messageText = "Cannot Create Archive"
        errorPopup.informativeText = "Create Archive Manually With Finder Instead"
        var error: AutoreleasingUnsafeMutablePointer<NSDictionary?> = nil
        
        //create and execute script to run Archive Utility
        let homedir = NSHomeDirectory()
        
        //might have to use interpolation and string literals? to decompose path as string objects like in StorageAccess.  Another possibility would be to execute a shell script to create the archive instead of applescript
        let archiveUtilPath = "System/Library/CoreServices/Applications/Archive Utility.app"
        
       
        //original script text:
        //unfortunately quotes cause problems
        //let archiveRunScript = ("open application file "Archive Utility.app" of folder "Applications" of folder "CoreServices" of folder "Library" of folder "System" of startup disk")
        
        //trying with colon for path
        //let archiveRunScript = ("open application file Macintosh HD:System:Library:CoreServices:Applications:Archive Utility.app")
        
        //trying with parentheses
        //let archiveRunScript = ("open application file ("Archive Utility.app") of folder ("Applications") of folder ("CoreServices") of folder ("Library") of folder ("System") of startup disk")
        
        let archiveRunScript = ("open application " + archiveUtilPath)
        println(archiveRunScript)
        var localSourceFile = homedir + "/Movies/iMovie Library.imovielibrary"
        let createScript: NSAppleScript = NSAppleScript(source: archiveRunScript)!
        if var runScript = createScript.executeAndReturnError(error){
            println("running script to create archive")

        }
        else{
            println("error running archive script")
            errorPopup.runModal()
            NSApplication.sharedApplication().terminate(self)
        }
        return
    }
    
    func unmakeArchive(){
        println("unmakeArchive is not yet implemented")
        return
    }


}