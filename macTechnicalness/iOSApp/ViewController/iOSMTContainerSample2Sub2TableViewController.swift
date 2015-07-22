//
//  iOSMTContainerSample2Sub2TableViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/22.
//
//

import UIKit

@objc(iOSMTContainerSample2Sub2TableViewController)
class iOSMTContainerSample2Sub2TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        let tableSize = self.tableView.contentSize
        println("[sub2:will] tableSize: \(tableSize)")
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let tableSize = self.tableView.contentSize
        println("[sub2:did] tableSize: \(tableSize)")
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
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = "Apple."

        return cell
    }


}
