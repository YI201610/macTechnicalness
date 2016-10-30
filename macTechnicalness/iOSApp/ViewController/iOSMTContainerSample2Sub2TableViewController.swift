//
//  iOSMTContainerSample2Sub2TableViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/22.
//
//

import UIKit

/**
    storyboardで関連付けしたコンテナビューコントローラー配下だと、
    管理が煩雑のため、viewWill(/Did)Appearは使用しない
*/
@objc(iOSMTContainerSample2Sub2TableViewController)
class iOSMTContainerSample2Sub2TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tableSize = self.tableView.contentSize
        print("[sub2:will] tableSize: \(tableSize)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let tableSize = self.tableView.contentSize
        print("[sub2:did] tableSize: \(tableSize)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) 

        // Configure the cell...
        cell.textLabel?.text = "Apple."

        return cell
    }


}
