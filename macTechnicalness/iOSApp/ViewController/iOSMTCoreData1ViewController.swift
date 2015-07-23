//
//  iOSMTCoreData1ViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/23.
//
//

import UIKit

@objc(iOSMTCoreData1ViewController)
class iOSMTCoreData1ViewController: UIViewController {

    var coreDataCoordinator: CoodinatorCoreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.coreDataCoordinator = CoodinatorCoreData()
        
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
