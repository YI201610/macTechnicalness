//
//  OSXMTBlueTooth1WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/11.
//
//

import Cocoa
import CoreBluetooth

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
class OSXMTBlueTooth1WindowController: NSWindowController, CBCentralManagerDelegate {

    var isScanning = false
    var centralManager: CBCentralManager!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        /*
        @comment
        */
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    // =========================================================================
    // MARK: CBCentralManagerDelegate
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        
        switch central.state {
            
        case CBCentralManagerState.Unknown:
            println("***CBCentralManagerState: Unknown")
            
        case CBCentralManagerState.Resetting:
            println("***CBCentralManagerState: Resetting")
            
        case CBCentralManagerState.Unsupported:
            println("***CBCentralManagerState: Unsupported")
            
        case CBCentralManagerState.Unauthorized:
            println("***CBCentralManagerState: Unauthorized")
            
        case CBCentralManagerState.PoweredOff:
            println("***CBCentralManagerState: PoweredOff")
            
        case CBCentralManagerState.PoweredOn:
            println("***CBCentralManagerState: PoweredOn")
            
            /*
            @comment    PoweredOnになってからスキャニングを開始する
            */
            self.centralManager.scanForPeripheralsWithServices(nil, options: nil)
            
        }
    }
    
    /*!
    @abstract   スキャン中、ペリフェラルを発見した
    */
    func centralManager(central: CBCentralManager!,
        didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: [NSObject : AnyObject]!,
        RSSI: NSNumber!)
    {
        println("===============Peripheral SCANED======================")
        println("BLE Device: \(peripheral)")
        println("Ad: \(advertisementData)")
        println("RSSI: \(RSSI)")
        
        /*
        @comment    スキャニング中止
        */
        self.centralManager.stopScan()
        isScanning = false
    }
    
}
