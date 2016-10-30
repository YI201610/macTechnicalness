//
//  OSXMTBluetooth3WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/27.
//
//

import Cocoa
import CoreBluetooth


@objc(OSXMTBluetooth3WindowController)
class OSXMTBluetooth3WindowController: NSWindowController, CBCentralManagerDelegate, NSWindowDelegate, CBPeripheralDelegate {
    
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
    
    //--------------------------------------------
    // MARK: NSWindowDelegate
    
    func windowWillClose(notification: NSNotification) {
        
        /*
        @comment    スキャンを停止する
        */
        self.centralObject.stopScan()
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
            print("scanning peripheral...")
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
        
        self.peripheralArray.append(peripheral)
        
        /*
        @comment    ペリフェラルに接続する
        */
        peripheral.delegate = self
        self.centralObject.connectPeripheral(peripheral, options: nil)
    }
    
    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!)
    {
        print("[\(peripheral.name)]ペリフェラルに接続しました。")

        /*
        @comment    サービスの検索を開始する
        */
        peripheral.discoverServices(nil)
        
        
        
//        /*
//        @comment    接続を解除する
//        */
//        self.centralObject.cancelPeripheralConnection(peripheral)
    }
    
    /*!
    @abstract
    */
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!)
    {
        print("[\(peripheral.name)]ペリフェラルとの接続に失敗しました。")
    }
    
    //--------------------------------------------
    // MARK: ペリフェラルデリゲート
    
    /*!
    @abstract   サービスが見つかった
    */
    func peripheral(peripheral: CBPeripheral!, didDiscoverServices error: NSError!) {
        
        let serviceArray: NSArray = peripheral.services
        
        /*
        @comment    ペリフェラルのサービスを列挙する
        */
        for service in serviceArray {
            print("*[\(peripheral)] service: \(service.debugDescription)")
            
            /*
            @comment    キャラクタリスティックの検索を開始する
            */
            peripheral.discoverCharacteristics(nil, forService: service as! CBService)
        }
    }
    

    /*!
    @abstract
    */
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
        
        let characteristicArray: NSArray = service.characteristics
        
        for characteristic in characteristicArray {
            
            if let obj = characteristic as? CBCharacteristic {
                print("***{\(obj)}(\(service.peripheral.name))")
            }
            
        }
        
    }
    
    
    //--------------------------------------------
    // MARK: キーダウンイベント
    override func keyDown(theEvent: NSEvent) {

        print("===============current state===================")
        /*
        @comment    
        */
        for peripheralObject in self.peripheralArray {
            
            switch peripheralObject.state {
                
                
            case CBPeripheralState.Disconnected:
                print("peripheral[\(peripheralObject.name)]: Disconnected.")
                
            case CBPeripheralState.Connecting:
                print("peripheral[\(peripheralObject.name)]: Connecting...")
                
            case CBPeripheralState.Connected:
                print("peripheral[\(peripheralObject.name)]: Connected.")
                
            }
        }

    }
    
    
    
}
