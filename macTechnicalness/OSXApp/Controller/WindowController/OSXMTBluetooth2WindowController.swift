//
//  OSXMTBluetooth2WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/19.
//
//

import Cocoa
import CoreBluetooth

/*!
@abstract   ペリフェラルに接続してみる
*/
@objc(OSXMTBluetooth2WindowController)
class OSXMTBluetooth2WindowController: NSWindowController, CBCentralManagerDelegate {

    var centralObject: CBCentralManager!
    
    var peripheralObject: CBPeripheral!
    
    //---------------------------------------------
    // MARK: ビューライフサイクル
    
    override func windowDidLoad() {
        super.windowDidLoad()

        centralObject = CBCentralManager(delegate: self, queue: nil)
    }
    
    //---------------------------------------------
    // MARK: CBCentralManagerDelegate
    
    /*!
    @abstract   セントラル・マネージャーの状態が変化した
    */
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

        peripheralObject = peripheral
        
        centralObject.connectPeripheral(peripheralObject, options: nil)
        
    }

    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!)
    {
        println("ペリフェラルに接続しました。")
    }
    
    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!)
    {
        println("ペリフェラルとの接続に失敗しました。")
    }
    
}
