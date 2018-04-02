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
    
    func centralManagerDidUpdateState(_ central: CBCentralManager!) {
        
        switch central.state {
            
        case CBCentralManagerState.unknown:
            print("***CBCentralManagerState: Unknown")
            
        case CBCentralManagerState.resetting:
            print("***CBCentralManagerState: Resetting")
            
        case CBCentralManagerState.unsupported:
            print("***CBCentralManagerState: Unsupported")
            
        case CBCentralManagerState.unauthorized:
            print("***CBCentralManagerState: Unauthorized")
            
        case CBCentralManagerState.poweredOff:
            print("***CBCentralManagerState: PoweredOff")
            
        case CBCentralManagerState.poweredOn:
            print("***CBCentralManagerState: PoweredOn")
            
            /*
            @comment    PoweredOnになってからスキャニングを開始する
            */
            self.centralManager.scanForPeripherals(withServices: nil, options: nil)
            
        }
    }
    
    /*!
    @abstract   スキャン中、ペリフェラルを発見した
    */
    func centralManager(_ central: CBCentralManager!,
        didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: [AnyHashable: Any]!,
        RSSI: NSNumber!)
    {
        print("===============Peripheral SCANED======================")
        print("BLE Device: \(peripheral)")
        print("Ad: \(advertisementData)")
        print("RSSI: \(RSSI)")
        
        /*
        @comment    スキャニング中止
        */
        self.centralManager.stopScan()
        isScanning = false
    }
    
}
