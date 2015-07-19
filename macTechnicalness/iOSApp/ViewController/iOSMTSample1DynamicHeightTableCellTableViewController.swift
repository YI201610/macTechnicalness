//
//  iOSMTSample1DynamicHeightTableCellTableViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/19.
//
//

import UIKit

/**
    高さ可変のテーブルビューセル。

    参考文献: http://dev.classmethod.jp/smartphone/iphone/how-to-make-adjustable-cell/
*/
@objc(iOSMTSample1DynamicHeightTableCellTableViewController)
class iOSMTSample1DynamicHeightTableCellTableViewController: UITableViewController {
    
    var dataObjectArray: NSMutableArray = []
    var stubCell: iOSMTSample1DynamicHeightTableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        @comment
        */
        self.tableView.estimatedRowHeight = 40
        
        /*
        @comment    計測用のセルを取得
        */
        self.stubCell = self.tableView.dequeueReusableCellWithIdentifier("dynamicHeightCell") as? iOSMTSample1DynamicHeightTableViewCell
        
        /*
        @comment    テーブルに乗っけるテストデータを作成
        */
        var data1Dictionary: NSMutableDictionary = [
            "message" : "The UIActivity class is an abstract class that you subclass in order to implement application-specific services. A service takes data that is passed to it, does something to that data, and returns the results. For example, an social media service might take whatever text, images, or other content is provided to it and post them to the user’s account. Activity objects are used in conjunction with a UIActivityViewController object, which is responsible for presenting services to the user. You should subclass UIActivity only if you want to provide custom services to the user. The system already provides support for many standard services and makes them available through the UIActivityViewController object. For example, the standard activity view controller supports emailing data, posting items to one of the user’s social media accounts, and several other options. You do not have to provide custom services for any of the built-in types.",
            "date" : NSDate()
        ]

        var data2Dictionary: NSMutableDictionary = [
            "message" : "The UIActivity class is an abstract class that you subclass in order to implement application-specific services. テスト。",
            "date" : NSDate()
        ]

        self.dataObjectArray.addObject(data1Dictionary)
        self.dataObjectArray.addObject(data2Dictionary)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.dataObjectArray.count
    }
    
    func configureCell(cell: iOSMTSample1DynamicHeightTableViewCell, atIndex:NSIndexPath)
    {
        let dataObject: NSDictionary = (self.dataObjectArray[atIndex.row] as? NSDictionary)!
        
        cell.mainLabel.text = dataObject.valueForKey("message") as? String
        
        var date: NSDate = (dataObject.valueForKey("date") as? NSDate)!
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd HH:mm:ss"
        cell.subLabel.text = dateFormatter.stringFromDate(date)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("dynamicHeightCell", forIndexPath: indexPath) as! iOSMTSample1DynamicHeightTableViewCell

        // Configure the cell...
        self.configureCell(cell, atIndex: indexPath)

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        let maxWidth = CGRectGetWidth(self.tableView.frame)

        self.configureCell(self.stubCell!, atIndex: indexPath)
        self.stubCell?.layoutSubviews()
        
        //
        /*
        @comment    15: leading constraintの定数値
        */
        self.stubCell?.mainLabel.preferredMaxLayoutWidth = maxWidth - 15

        let cellSize = self.stubCell!.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        println("cellSize: \(cellSize)")
        
        return cellSize.height + 1
    }


}
