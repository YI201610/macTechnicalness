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
class OSXMTBluetooth2WindowController: NSWindowController, CBCentralManagerDelegate, NSWindowDelegate {

    /*!
    @abstract
    */
    var centralObject: CBCentralManager!
    
    /*!
    @abstract   ペリフェラルを格納する領域
    */
    var peripheralArray = Array<AnyObject>()

    
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
            centralObject.scanForPeripheralsWithServices(nil, options: nil)

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

        /*
        @comment    存在チェック
        */
        for obj in self.peripheralArray {
            if obj.isEqual(peripheral) {
                return
            }
        }

        println("===============Peripheral SCANED======================")
        println("BLE Device: \(peripheral)")
        println("Ad: \(advertisementData)")
        println("RSSI: \(RSSI)")
        
        self.peripheralArray.append(peripheral)
        
        /*
        @comment
        */
        //self.centralObject.stopScan()
        
        /*
        @comment
        */
        //self.centralObject.connectPeripheral(self.peripheralObject, options: nil)
        
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
    
    //--------------------------------------------
    // MARK:
    func windowWillClose(notification: NSNotification) {
        
        self.centralObject.stopScan()
    }
    
    
}
