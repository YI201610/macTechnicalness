//
//  iOSMTContainerSample2Sub1ViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/22.
//
//

import UIKit

@objc(iOSMTContainerSample2Sub1ViewController)
class iOSMTContainerSample2Sub1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("[will] sub1 - viewWillAppear...")
    }

//    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
//        return true
//    }
//    
//    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
//        return true
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
