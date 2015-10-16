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
        print("momdURL: \(momdURL?.absoluteString)")
        self.textView1.text = momdURL?.absoluteString

        self.textView1.textContainer.lineFragmentPadding = 0;
        self.textView1.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5);

        /*
        @comment    NSManagedObjectModelを読み込む
        */
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: momdURL!)
        print("managedObjectModel: \(managedObjectModel)")
        self.textView2.text = managedObjectModel?.description

//        self.textView2.textContainer.lineFragmentPadding = 0;
//        self.textView2.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5);

        /*
        @comment    ストア・コーディネーターを作成する。処理は、直ちに完了する。
        */
        let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        print("storeCoordinator: \(storeCoordinator)")
        
        let someQueue: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(someQueue, {
            
            print("非同期で、persistentStoreを初期化中...")
        
            let fileManager: NSFileManager = NSFileManager.defaultManager()
            let directoryArray: NSArray = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
            
            var storeURL: NSURL? = nil
            storeURL = directoryArray.lastObject! as? NSURL
            storeURL = storeURL?.URLByAppendingPathComponent("iOSMTCoreData1.sqlite")
            
            var error: NSError? = nil
            var persistentStore: NSPersistentStore?
            do {
                persistentStore = try storeCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
            } catch let error1 as NSError {
                error = error1
                persistentStore = nil
            } catch {
                fatalError()
            }
            
            if persistentStore == nil {
                print("error: \(error?.localizedDescription), userInfo: \(error?.userInfo)")
            }
            
            dispatch_sync(dispatch_get_main_queue(), {
                self.didFinishPersistentStoreInitialization()
            })
        })
        
    }

    func didFinishPersistentStoreInitialization()
    {
        print("CoreDataのSaveコーディネーター、初期化処理が完了しました.")
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
