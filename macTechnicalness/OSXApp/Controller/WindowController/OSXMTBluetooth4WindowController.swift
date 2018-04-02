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
    
    func windowWillClose(_ notification: Notification) {
        
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
            centralObject.scanForPeripherals(withServices: nil, options: nil)
            
        }
    }
    
    /*!
    @abstract   スキャン中、ペリフェラルを発見した
    */
    func centralManager(_ central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [AnyHashable: Any]!, RSSI: NSNumber!)
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
        self.centralObject.connect(peripheral, options: nil)
    }
    
    /*!
    @abstract
    */
    func centralManager(_ central: CBCentralManager!, didConnect peripheral: CBPeripheral!)
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
    func centralManager(_ central: CBCentralManager!, didFailToConnect peripheral: CBPeripheral!, error: Error!)
    {
        print("[\(peripheral.name)]ペリフェラルとの接続に失敗しました。")
    }
    
    //--------------------------------------------
    // MARK: ペリフェラルデリゲート
    
    /*!
    @abstract   サービスが見つかった
    */
    func peripheral(_ peripheral: CBPeripheral!, didDiscoverServices error: Error!) {
        
        let serviceArray: NSArray = peripheral.services
        
        /*
        @comment    ペリフェラルのサービスを列挙する
        */
        for service in serviceArray {
            print("*[\(peripheral)] service: \((service as AnyObject).debugDescription)")
            
            /*
            @comment    キャラクタリスティックの検索を開始する
            */
            peripheral.discoverCharacteristics(nil, for: service as! CBService)
        }
    }
    
    
    /*!
    @abstract   キャラクタリスティックを発見した
    */
    func peripheral(_ peripheral: CBPeripheral!, didDiscoverCharacteristicsFor service: CBService!, error: Error!) {
        
        let characteristicArray: NSArray = service.characteristics
        
        for characteristic in characteristicArray {
            
            if let obj = characteristic as? CBCharacteristic {
                print("***{\(obj)}(\(peripheral.name))")
                
                /*
                @comment    キャラクタリスティックを読み出し専用かを判定
                */
                if obj.properties == CBCharacteristicProperties.read {
                    
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
                    peripheral.readValue(for: obj)
                }
                
            }
            
        }
        
    }
    
    /*!
    @abstract   キャラクタリスティックの読み出しが完了した
    */
    func peripheral(_ peripheral: CBPeripheral!, didUpdateValueFor characteristic: CBCharacteristic!, error: Error!) {
        print("-----------READ: Characteristic Data [\(peripheral.name)]--------------")
    
        let serviceUUID: NSString = characteristic.service.uuid.uuidString as NSString
        let characteristicUUID: NSString = characteristic.uuid.uuidString as NSString
        let readValue: Data? = characteristic.value
        let characteristicDescription: NSString = characteristic.description as NSString
        
        print("- Service UUID: \(serviceUUID)")
        print("- Characteristic UUID: \(characteristicUUID)")
        print("- Description: \(characteristicDescription)")
        print("- Read value: \(readValue)")
    
    }
    
    
    //--------------------------------------------
    // MARK: キーダウンイベント
    override func keyDown(with theEvent: NSEvent) {
        
        print("===============current state===================")
        /*
        @comment
        */
        for peripheralObject in self.peripheralArray {
            
            switch peripheralObject.state {
                
                
            case CBPeripheralState.disconnected:
                print("peripheral[\(peripheralObject.name)]: Disconnected.")
                
            case CBPeripheralState.connecting:
                print("peripheral[\(peripheralObject.name)]: Connecting...")
                
            case CBPeripheralState.connected:
                print("peripheral[\(peripheralObject.name)]: Connected.")
                
            }
        }
    }
}

