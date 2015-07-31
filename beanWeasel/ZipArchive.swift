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
        
       
        //original script text from Script Editor.app:
        //let archiveRunScript = "open application file "Archive Utility.app" of folder "Applications" of folder "CoreServices" of folder "Library" of folder "System" of startup disk"
        //unfortunately quotes cause problems
        
        //solution : use string literals from https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html
        
        //let archiveRunScript = "tell application \"Finder\" activate open application file \"Archive Utility.app\" of folder \"Applications\" of folder \"CoreServices\" of folder \"Library\" of folder \"System\" of startup disk end tell"
        
        //but we stil get an error: (error running archive script, 0x0000000000000000)  
        //now considering shell script......  gzip -cfk ~/Movies/iMovie\ Library//\.imovielibrary
        //"tar -czf" will create the archive!!!
        //tar -czvf archive.tar.gz ~/Movies/iMovie\ Library\.imovielibrary

    
        
        
       
        println(archiveRunScript)
        var localSourceFile = homedir + "/Movies/iMovie Library.imovielibrary"
        let createScript: NSAppleScript = NSAppleScript(source: archiveRunScript)!
        if var runScript = createScript.executeAndReturnError(error){
            println("running script to create archive")
        }
        else{
            println("error running archive script","\(error)")
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