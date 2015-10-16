//
//  iOSMTSample1UIActivityViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/18.
//
//

import UIKit
import Social

@objc(iOSMTSample1UIActivityViewController)
class iOSMTSample1UIActivityViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func didSelectShowButton(sender: UIButton) {

        /*
        let activityViewController = UIActivityViewController(activityItems: ["サンプルメッセージ"], applicationActivities: nil)
//        activityViewController.excludedActivityTypes = [
//            UIActivityTypeMessage,
//            UIActivityTypeMail,
//            UIActivityTypePrint,
//            UIActivityTypeCopyToPasteboard,
//            UIActivityTypeAssignToContact,
//            UIActivityTypeSaveToCameraRoll,
//            UIActivityTypeAddToReadingList,
//            UIActivityTypePostToFlickr,
//            UIActivityTypePostToVimeo,
//            UIActivityTypePostToTencentWeibo,
//            UIActivityTypePostToWeibo,
//            UIActivityTypeAirDrop]
        
        activityViewController.completionWithItemsHandler = {(activityType, completed:Bool, returnedItems:Array!, error:NSError!) in
            
            var resultText: String = "[activityType] \(activityType), \n[completed] \(completed), \n[error] \(error)"
            print(resultText)
            
            self.resultTextView.text = resultText
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        */

    }
    
    
}
