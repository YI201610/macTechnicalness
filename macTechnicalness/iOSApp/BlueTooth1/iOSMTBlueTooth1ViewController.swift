//
//  iOSMTBlueTooth1ViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/14.
//
//

import UIKit
import CoreBluetooth

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}