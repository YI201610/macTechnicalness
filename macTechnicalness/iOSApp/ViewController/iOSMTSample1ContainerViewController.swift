//
//  iOSMTSample1ContainerViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/18.
//
//

import UIKit

class iOSMTSample1ContainerViewController: UIViewController {

    var pageViewController: iOSMTSample1UIPageViewController!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
        self.pageViewController = segue.destinationViewController as! iOSMTSample1UIPageViewController

        println(self.pageViewController)
        
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }

}
