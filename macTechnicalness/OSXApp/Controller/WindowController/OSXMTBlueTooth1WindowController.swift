//
//  OSXMTBlueTooth1WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/11.
//
//

import Cocoa

/*
@comment    アップルのListerサンプルから引用

To ensure that the `List` class
is unarchivable from an instance that was archived in the Objective-C version of Lister, the `List` class
declaration is annotated with @objc(AAPLList). This annotation ensures that the runtime name of the `List`
class is the same as the `AAPLList` class defined in the Objective-C version of the app. It also allows
the Objective-C version of Lister to unarchive a `List` instance that was archived in the Swift version.

https://developer.apple.com/library/mac/samplecode/Lister/Listings/Swift_Common_List_swift.html

*/
@objc(OSXMTBlueTooth1WindowController)
class OSXMTBlueTooth1WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
 
        println("swiftのWindow Controller読み込まれたよ")
        
    }
    
}
