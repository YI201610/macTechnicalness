//
//  OSXMTBlueTooth1WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/11.
//
//

import Cocoa
import CoreBluetooth

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
        
        /*
        @comment
        */
        self.centralManager.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    // =========================================================================
    // MARK: CBCentralManagerDelegate
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        println("state: \(central.state)")
    }
    
    /*!
    @abstract   スキャン中、ペリフェラルを発見した
    */
    func centralManager(central: CBCentralManager!,
        didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: [NSObject : AnyObject]!,
        RSSI: NSNumber!)
    {
        println("BLE Device: \(peripheral)")
        println("Ad: \(advertisementData)")
        println("RSSI: \(RSSI)")
        self.centralManager.stopScan()
        isScanning = false
    }
    
}
