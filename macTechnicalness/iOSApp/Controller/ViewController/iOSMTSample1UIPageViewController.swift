//
//  iOSMTCase1PageViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/11.
//
//

import UIKit

/*!
@abstract   複数の画像をページングすることができる
*/
@objc(iOSMTSample1UIPageViewController)
class iOSMTSample1UIPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var imageNameStringArray: NSArray!
    
    /**
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageNameStringArray = NSArray(objects: "purple240x2000", "red240x120", "green240x120", "blue120x320")
        
        self.dataSource = self;
        
        var startVC = self.viewControllerAtIndex(0) as iOSMTSome1ContentViewController
        var viewControllers = NSArray(object: startVC)
        self.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewControllerAtIndex(index: Int) -> iOSMTSome1ContentViewController
    {
        if index >= self.imageNameStringArray.count {
            return iOSMTSome1ContentViewController()
        }
        
        /**
            storyboardからコンテナビューコントローラーのインスタンスを取得する
        */
        var contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! iOSMTSome1ContentViewController
        
        contentViewController.pageIndexValue = index
        contentViewController.imageNameString = self.imageNameStringArray[index] as! String
        
        
        return contentViewController
    }

    //--------------------------------------------
    // MARK: UIPageViewControllerDataSource
    
    /**
    前ページを返す
    */
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        
        var vc = viewController as! iOSMTSome1ContentViewController
        var index = vc.pageIndexValue as Int
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    /**
    次ページを返す
    */
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! iOSMTSome1ContentViewController
        var index = vc.pageIndexValue as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (index == self.imageNameStringArray.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }

//    /**
//        ページコントロール
//    */
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
//    {
//        return self.imageNameStringArray.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
//    {
//        return 0
//    }
}
