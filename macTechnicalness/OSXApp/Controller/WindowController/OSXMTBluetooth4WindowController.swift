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
    @abstract   キャラクタリスティックを発見した
    */
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
        
        let characteristicArray: NSArray = service.characteristics
        
        for characteristic in characteristicArray {
            
            if let obj = characteristic as? CBCharacteristic {
                print("***{\(obj)}(\(peripheral.name))")
                
                /*
                @comment    キャラクタリスティックを読み出し専用かを判定
                */
                if obj.properties == CBCharacteristicProperties.Read {
                    
                    /*
                    @comment    キャラクタリスティックを読む. 
                        
                    2015.06.28: ペアリングをペリフェラルに要求してしまう。
                    ペアリングすると、率直にreadValueすることが、できなくなった。
                    
                    参考0
                    http://stackoverflow.com/questions/30116221/pairing-in-core-bluetooth-peripheral-application-ios

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
        print("-----------READ: Characteristic Data [\(peripheral.name)]--------------")
    
        let serviceUUID: NSString = characteristic.service.UUID.UUIDString
        let characteristicUUID: NSString = characteristic.UUID.UUIDString
        let readValue: NSData? = characteristic.value()
        let characteristicDescription: NSString = characteristic.description
        
        print("- Service UUID: \(serviceUUID)")
        print("- Characteristic UUID: \(characteristicUUID)")
        print("- Description: \(characteristicDescription)")
        print("- Read value: \(readValue)")
    
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

