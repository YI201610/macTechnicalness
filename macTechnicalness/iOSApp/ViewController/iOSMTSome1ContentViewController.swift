//
//  iOSMTSome1ContentViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/17.
//
//

import UIKit

@objc(iOSMTSome1ContentViewController)
class iOSMTSome1ContentViewController: UIViewController {

    var pageIndexValue: Int = 0
    var imageNameString: String = ""
    

    /**
        画像
    */
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("*imageName: \(self.imageNameString)")
        self.imageView.image = UIImage(named: self.imageNameString)
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
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
