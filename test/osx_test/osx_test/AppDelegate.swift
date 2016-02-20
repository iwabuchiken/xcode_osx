//
//  AppDelegate.swift
//  osx_test
//
//  Created by mac on 2016/02/20.
//  Copyright © 2016年 livetill150. All rights reserved.
//

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var masterViewController: MasterViewController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        masterViewController = MasterViewController(nibName: "MasterViewController", bundle: nil)
        
        window.contentView!.addSubview(masterViewController.view)
        masterViewController.view.frame = (window.contentView! as NSView).bounds
        
        //debug
        print("[\(Methods.basename(__FILE__)):\(__LINE__)] setup view => done")

        //
        _test_RealmRelated()
        
    }

    func _test_RealmRelated() {
    
        let realmPath = Realm.Configuration.defaultConfiguration.path
        
        let dpath_realm = Methods.dirname(realmPath!)

        //debug
        print("[\(Methods.basename(__FILE__)):\(__LINE__)] dpath_realm => \(dpath_realm)")
        
        // realm
        let r = Methods.get_RealmInstance(CONS.s_Realm_FileName)
        
        let resOf_Clips = try! r.objects(Clip).sorted("id", ascending: false)

        //debug
        print("[\(Methods.basename(__FILE__)):\(__LINE__)] resOf_Clips.count => \(resOf_Clips.count)")

        
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

