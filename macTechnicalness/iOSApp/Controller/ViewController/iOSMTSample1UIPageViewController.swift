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

UIViewControllerに、ContentView組みこまねばならぬかな
http://stackoverflow.com/questions/21045630/how-to-put-the-uipagecontrol-element-on-top-of-the-sliding-pages-within-a-uipage/21048603#21048603


*/
@objc(iOSMTSample1UIPageViewController)
class iOSMTSample1UIPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var imageNameStringArray: NSArray!
    
    var pageControl: UIPageControl!
    
    var pageControlDelegate: iOSMTSample1ContainerViewController? = nil
    
    /**
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageNameStringArray = NSArray(objects: "purple240x2000", "red240x120", "green240x120", "blue120x320")
        
        self.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as iOSMTSome1ContentViewController
        var viewControllers = NSArray(object: startVC)
        
//        self.setViewControllers(self.viewControllers, direction: .Forward, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewControllerAtIndex(_ index: Int) -> iOSMTSome1ContentViewController
    {
        if index >= self.imageNameStringArray.count {
            return iOSMTSome1ContentViewController()
        }
        
        /**
            storyboardからコンテナビューコントローラーのインスタンスを取得する
        */
        let contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! iOSMTSome1ContentViewController
        
        contentViewController.pageIndexValue = index
        contentViewController.imageNameString = self.imageNameStringArray[index] as! String
        
        
        return contentViewController
    }

    //--------------------------------------------
    // MARK: UIPageViewControllerDataSource
    
    /**
    前ページを返す
    */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
        let vc = viewController as! iOSMTSome1ContentViewController
        var index = vc.pageIndexValue as Int
        
        if (self.pageControlDelegate?.responds(to: Selector("pageChanged:")) != nil) {
            self.pageControlDelegate?.pageChanged(index)
        }
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index -= 1
        


        return self.viewControllerAtIndex(index)
        
    }
    
    /**
    次ページを返す
    */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! iOSMTSome1ContentViewController
        var index = vc.pageIndexValue as Int

        if (self.pageControlDelegate?.responds(to: Selector("pageChanged:")) != nil) {
            self.pageControlDelegate?.pageChanged(index)
        }
        
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index += 1
        
        if (index == self.imageNameStringArray.count)
        {
            return nil
        }


        return self.viewControllerAtIndex(index)
        
    }

//    /**
//        このメソッドを実装すると、UIPageViewControllerのページコントロールが表示される
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
