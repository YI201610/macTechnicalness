//
//  iOSMTContainerSample2TableViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/11.
//
//

import UIKit

/*!
@abstract 開発の羅針盤

⬛︎ M/V/C 原則

    Viewは、Entityを保持しない。入力のインターフェースのみもつ。
    Viewのインターフェースに、Modelデータをアサインするのは、Controllerの責務である。
    --------
    したがって、MVCデザインにおいては、ビューが「setupWithEntity: 」というようなメソッドをもつことはない。

    それ的な処理をしたいのであれば、ViewController側に、setupCellPropertiesWithEntity: といったメソッドを設けて対応する。

    Viewと、Modelは、疎結合にする。
    Viewと、Modelを結合する役割は、Controllerが担う。

⬛︎ Container View Controllerと、Content Viewの、連携の原則

    ・継承は使用しない
    ・プロトコルにより、親と連携する。



*/
@objc(iOSMTContainerSample2TableViewController)
class iOSMTContainerSample2TableViewController: UITableViewController {

    var sub1ViewController: iOSMTContainerSample2Sub1ViewController?
    var sub2ViewController: iOSMTMultiTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
//    override func viewWillAppear(animated: Bool) {
//        println("[will]コンテナビューを管理するビューコントローラーのviewWillAppear...")
//        
//
//        //
//        self.sub2ViewController?.beginAppearanceTransition(true, animated: true)
//
//        let sub2tableSize = self.sub2ViewController!.tableView.contentSize
//        println("sub2TableSize: \(sub2tableSize)")
//        
//        let sub2TotalHeight = self.sub2ViewController!.totalContentSize()
//        println("sub2TotalHeight: \(sub2tableSize)")
//
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        println("[did]コンテナビューを管理するビューコントローラーのviewDidAppear...")
//        
//        let sub2tableSize = self.sub2ViewController!.tableView.contentSize
//        println("sub2TableSize: \(sub2tableSize)")
//
//    }
    
//    override func viewWillLayoutSubviews() {
//        println("[willLayout]コンテナビューを管理するビューコントローラーのviewWillLayoutSubviews...")
//        
//        let sub2tableSize = self.sub2ViewController!.tableView.contentSize
//        println("sub2TableSize: \(sub2tableSize)")
//
//    }

//    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
//        return true
//    }
//    
//    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
//        return true
//    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 3
//    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        var heightValue:CGFloat = 50
        
        if indexPath.row == 1 {
            heightValue = self.sub2ViewController!.totalContentSize(maxWidthValue: tableView.frame.width)
        }

        return heightValue
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sub1ViewController" {
            self.sub1ViewController = segue.destinationViewController as? iOSMTContainerSample2Sub1ViewController
        } else if segue.identifier == "sub2ViewController" {
            self.sub2ViewController = segue.destinationViewController as? iOSMTMultiTableViewController
        }
        
        
    }
    


}
