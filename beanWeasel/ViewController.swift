//
//  ViewController.swift
//  beanWeasel
//
//  Created by tbrown on 7/27/15.
//  Copyright (c) 2015 doktorbrown. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("View Loaded")
        textView.string = "Press Button to Start"
        resetToBeginning()
    }
    
    //reset UI to not show progress indicators
    func resetToBeginning() {
        progressWheel.hidden = true
        progressLine.hidden = true
    }
    
    @IBAction func restore(sender: AnyObject) {
        label.stringValue = "Restore"
        //unhide the progress wheel
        progressWheel.hidden = false
        //start the spin
        progressWheel.startAnimation(self)
        
        textView.string = "Spin Spin Spin"
        println("Spinny Started")
        
        //create zip archive
        let fileZip = ZipArchive()
        fileZip.makeArchive()
        
        //create an instance of the StorageAccess class. This is the missing link for how to access a class!!! woot!
        let mcServer = StorageAccess()
        
        //pass the getServerAddress method from the instance to the textView
        textView.string = mcServer.getServerAddress()
        
        
    }
    
    
    
    @IBAction func backup(sender: AnyObject) {
        label.stringValue = "Backup"
        
        progressWheel.hidden = true
        
        progressWheel.stopAnimation(self)
        
        
        textView.string = "Spin Spin Stop"
        
        println("Spinny Stopped")
        let backupLocation = StorageAccess()
        backupLocation.connectToServer()
        
    }
    
    
    @IBOutlet weak var progressWheel: NSProgressIndicator!
    @IBOutlet weak var label: NSTextField!
    
    @IBOutlet weak var progressLine: NSProgressIndicator!
    
    
    @IBOutlet var textView: NSTextView!
    
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

