//
//  iOSMTBlueTooth1ViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/14.
//
//

import UIKit
import CoreBluetooth

@objc(iOSMTBlueTooth1ViewController)
class iOSMTBlueTooth1ViewController: UIViewController, CBCentralManagerDelegate {

    var centralManager: CBCentralManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.centralManager = CBCentralManager(delegate: self, queue: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }

}
