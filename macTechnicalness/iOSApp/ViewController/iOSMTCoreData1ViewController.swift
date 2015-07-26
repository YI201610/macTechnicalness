//
//  iOSMTCoreData1ViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/23.
//
//

import UIKit
import CoreData


@objc(iOSMTCoreData1ViewController)
class iOSMTCoreData1ViewController: UIViewController {

    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        @comment    NSManagedObjectModelのURLを取得
        */
        let momdURL =  NSBundle.mainBundle().URLForResource("iOSMTCoreData1", withExtension: "momd");
        println("momdURL: \(momdURL?.absoluteString)")
        self.textView1.text = momdURL?.absoluteString
        
        /*
        @comment    NSManagedObjectModelを読み込む
        */
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: momdURL!)
        println("managedObjectModel: \(managedObjectModel)")
        self.textView2.text = managedObjectModel?.description
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
