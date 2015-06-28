//
//  OSXMTBluetooth4WindowController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/27.
//
//

import Cocoa
import CoreBluetooth


@objc(OSXMTBluetooth4WindowController)
class OSXMTBluetooth4WindowController: NSWindowController, CBCentralManagerDelegate, NSWindowDelegate, CBPeripheralDelegate {
    
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
        
        println("===============Peripheral SCANED======================")
        println("BLE Device Name: \(peripheral)")
        println("Ad: \(advertisementData)")
        println("RSSI: \(RSSI)")
        
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
        println("[\(peripheral.name)]ペリフェラルに接続しました。")
        
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
        println("[\(peripheral.name)]ペリフェラルとの接続に失敗しました。")
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
            println("*[\(peripheral)] service: \(service.debugDescription)")
            
            /*
            @comment    キャラクタリスティックの検索を開始する
            */
            peripheral.discoverCharacteristics(nil, forService: service as! CBService)
        }
    }
    
    
    /*!
    @abstract   キャラクタリスティックを発見した
    */
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
        
        let characteristicArray: NSArray = service.characteristics
        
        for characteristic in characteristicArray {
            
            if let obj = characteristic as? CBCharacteristic {
                println("***{\(obj)}(\(peripheral.name))")
                
                /*
                @comment    キャラクタリスティックを読み出し専用かを判定
                */
                if obj.properties == CBCharacteristicProperties.Read {
                    
                    /*
                    @comment    キャラクタリスティックを読む. 
                        
                    2015.06.28: ペアリングをペリフェラルに要求してしまう。
                    ペアリングすると、率直にreadValueすることが、できなくなった。

                    参考1
                    http://stackoverflow.com/questions/27972757/bluetooth-pairing-vs-connection-in-objective-c
                    
                    参考2
                    http://stackoverflow.com/questions/19589836/ios-bluetooth-le-unable-to-connect-using-stored-pairing-data
                    */
                    peripheral.readValueForCharacteristic(obj)
                }
                
            }
            
        }
        
    }
    
    /*!
    @abstract   キャラクタリスティックの読み出しが完了した
    */
    func peripheral(peripheral: CBPeripheral!, didUpdateValueForCharacteristic characteristic: CBCharacteristic!, error: NSError!) {
        println("-----------READ: Characteristic Data [\(peripheral.name)]--------------")
    
        let serviceUUID: NSString = characteristic.service.UUID.UUIDString
        let characteristicUUID: NSString = characteristic.UUID.UUIDString
        let readValue: NSData? = characteristic.value()
        let characteristicDescription: NSString = characteristic.description
        
        println("- Service UUID: \(serviceUUID)")
        println("- Characteristic UUID: \(characteristicUUID)")
        println("- Description: \(characteristicDescription)")
        println("- Read value: \(readValue)")
    
    }
    
    
    //--------------------------------------------
    // MARK: キーダウンイベント
    override func keyDown(theEvent: NSEvent) {
        
        println("===============current state===================")
        /*
        @comment
        */
        for peripheralObject in self.peripheralArray {
            
            switch peripheralObject.state {
                
                
            case CBPeripheralState.Disconnected:
                println("peripheral[\(peripheralObject.name)]: Disconnected.")
                
            case CBPeripheralState.Connecting:
                println("peripheral[\(peripheralObject.name)]: Connecting...")
                
            case CBPeripheralState.Connected:
                println("peripheral[\(peripheralObject.name)]: Connected.")
                
            }
        }
    }
}

