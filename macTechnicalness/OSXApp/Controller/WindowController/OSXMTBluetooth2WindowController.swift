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
class OSXMTBluetooth2WindowController: NSWindowController, CBCentralManagerDelegate, NSWindowDelegate, CBPeripheralDelegate {

    /*!
    @abstract
    */
    var centralObject: CBCentralManager!
    
    /*!
    @abstract   ペリフェラルを格納する領域
    */
    var peripheralArray = Array<CBPeripheral>()

    
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
            print("***CBCentralManagerState: Unknown")
            
        case CBCentralManagerState.Resetting:
            print("***CBCentralManagerState: Resetting")
            
        case CBCentralManagerState.Unsupported:
            print("***CBCentralManagerState: Unsupported")
            
        case CBCentralManagerState.Unauthorized:
            print("***CBCentralManagerState: Unauthorized")
            
        case CBCentralManagerState.PoweredOff:
            print("***CBCentralManagerState: PoweredOff")
            
        case CBCentralManagerState.PoweredOn:
            print("***CBCentralManagerState: PoweredOn")

            /*
            @comment    PoweredOnになってからスキャニングを開始する
            */
            centralObject.scanForPeripheralsWithServices(nil, options: nil)

        }
    }
    
    /*!
    @abstract   スキャン中、ペリフェラルを発見した
    */
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!)
    {

        /*
        @comment    存在チェック
        */
        for obj in self.peripheralArray {
            if obj.isEqual(peripheral) {
                return
            }
        }

        print("===============Peripheral SCANED======================")
        print("BLE Device Name: \(peripheral)")
        print("Ad: \(advertisementData)")
        print("RSSI: \(RSSI)")
        
        peripheral.delegate = self
        self.peripheralArray.append(peripheral)
        
        /*
        @comment
        */
        self.centralObject.connectPeripheral(peripheral, options: nil)
        
    }

    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!)
    {
        print("[\(peripheral.name)]ペリフェラルに接続しました。")
 
        /*
        @comment    接続を解除する
        */
        self.centralObject.cancelPeripheralConnection(peripheral)
    }
    
    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!)
    {
        print("[\(peripheral.name)]ペリフェラルとの接続に失敗しました。")
    }
    
    //--------------------------------------------
    // MARK: NSWindowDelegate
    
    func windowWillClose(notification: NSNotification) {
        
        /*
        @comment    スキャンを停止する
        */
        self.centralObject.stopScan()
    }
    
    
}
