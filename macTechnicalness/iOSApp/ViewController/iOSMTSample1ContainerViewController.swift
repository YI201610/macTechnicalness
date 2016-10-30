//
//  iOSMTSample1ContainerViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/18.
//
//

import UIKit

protocol iOSMTSample1ContainerViewControllerDelegate{
    func pageChanged(_ index: Int)
}

class iOSMTSample1ContainerViewController: UIViewController {

    var pageViewController: iOSMTSample1UIPageViewController!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = 4
        self.pageControl.target(forAction: #selector(iOSMTSample1ContainerViewController.pageChanged(_:)), withSender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "hogeSegue" {
            self.pageViewController = segue.destination as! iOSMTSample1UIPageViewController
            
            print(self.pageViewController)
            
            self.pageViewController.pageControlDelegate = self
        }
        
        
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }

    internal func pageChanged(_ index: Int) {
        print("***pageChanged!! - \(index)")
        self.pageControl.currentPage = index
    }
}
