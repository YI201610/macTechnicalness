//
//  iOSMTMultiTableViewController.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/19.
//
//

import UIKit

/**
    高さ可変のUILabel、「Lines」プロパティを0に設定するのを忘れないこと。
*/
@objc(iOSMTMultiTableViewController)
class iOSMTMultiTableViewController: UITableViewController {

    //--------------------------------------------
    // MARK: User Interface
    @IBOutlet weak var button1: iOSMTSomeStateButton!
    @IBOutlet weak var button2: iOSMTSomeStateButton!
    
    var stubCell: iOSMSample1TMultiModelTableViewCell?
    
    @IBOutlet weak var tableHeaderView: UIView!
    
    //--------------------------------------------
    // MARK: Model Data
    var mode1DataArray: NSMutableArray = []
    var mode2DataArray: NSMutableArray = []
    
    
    //--------------------------------------------
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        self.tableView.exclusiveTouch = true

        
        self.button1.changeState(UIControlState.selected)
        self.button2.changeState(UIControlState())
        
        /*
        @comment
        */
        self.tableView.estimatedRowHeight = 40
        
        
        /*
        @comment    計測用のセルを取得
        */
        self.stubCell = self.tableView.dequeueReusableCell(withIdentifier: iOSMSample1TMultiModelTableViewCell.cellIdentifier()) as? iOSMSample1TMultiModelTableViewCell
        
        
        /*
        @comment    テーブルに乗っけるテストデータを作成
        */
        let data0Dictionary: NSMutableDictionary = [
            "message" : "１行目。",
            "date" : Date()
        ]

        let data1Dictionary: NSMutableDictionary = [
            "message" : "The UIActivity class is an abstract class that you subclass in order to implement application-specific services. A service takes data that is passed to it, does something to that data, and returns the results. For example, an social media service might take whatever text, images, or other content is provided to it and post them to the user’s account. Activity objects are used in conjunction with a UIActivityViewController object, which is responsible for presenting services to the user. You should subclass UIActivity only if you want to provide custom services to the user. The system already provides support for many standard services and makes them available through the UIActivityViewController object. For example, the standard activity view controller supports emailing data, posting items to one of the user’s social media accounts, and several other options. You do not have to provide custom services for any of the built-in types.",
            "date" : Date()
        ]
        
        let data2Dictionary: NSMutableDictionary = [
            "message" : "The UIActivity class is an abstract class that you subclass in order to implement application-specific services. テスト。",
            "date" : Date()
        ]
        
        let data3Dictionary: NSMutableDictionary = [
            "message" : " スマートウオッチ比較　電池はソニー、画面はＬＧ［有料会員限定］米アップルが2015年4月に発売した「Apple Watch（アップルウォッチ）」をはじめ、腕時計型端末のスマートウォッチが続々発売された。何ができて、どれだ…続き",
            "date" : Date()
        ]
        
        let data4Dictionary: NSMutableDictionary = [
            "message" : "接客の隙間時間に、ｅラーニングでスタッフのおもてなし力をアップ――。こんな取り組みをしているのが、靴専門店、ASBeeイオンモール多摩平の森店だ。同店は昨年11月、東京都日野市に新設されたショッピングモールのオープンと同時に営業を開始。店舗運営が軌道に乗った2015年１月から、iPadを使ったｅラーニングを本格的に始めている。アルバイトを中心としたスタッフは、店舗で顧客を待つ合間に集中的に自習する。「クイズ形式で学べて堅苦しさがないと、スタッフから好評」と、ASBeeイオンモール多摩平の森店の仲手川亜美店長は話す。このシステムを構築したのは、ASBeeの運営会社でイオングループのジーフット。ライトワークス（東京・千代田）のｅラーニング向けクラウドサービスに、独自の教育コンテンツを載せた。１年がかりで開発を進め、昨年10月に稼働させた。ASBeeにとどまらず、イオンの靴売り場であるGreenboxなど、ジーフットが運営する全国800以上の店舗にiPadを導入。教育での活用が進む。",
            "date" : Date()
        ]

        self.mode1DataArray.add(data0Dictionary)
        self.mode1DataArray.add(data1Dictionary)
        self.mode1DataArray.add(data2Dictionary)

        self.mode2DataArray.add(data4Dictionary)
        self.mode2DataArray.add(data3Dictionary)
        self.mode2DataArray.add(data2Dictionary)
        self.mode2DataArray.add(data1Dictionary)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //--------------------------------------------
    // MARK: button function
    
    @IBAction func didSelectButton1(_ sender: UIButton) {
        self.button1.changeState(UIControlState.selected)
        self.button2.changeState(UIControlState())
        
        self.tableView.reloadData()
    }
    
    @IBAction func didSelectButton2(_ sender: UIButton) {
        self.button1.changeState(UIControlState())
        self.button2.changeState(UIControlState.selected)
    
        self.tableView.reloadData()
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

        var rowCount = 0
        
        if self.button1.isSelected {
            rowCount = self.mode1DataArray.count
        } else {
            rowCount = self.mode2DataArray.count
        }
        
        return rowCount
    }

    func configureCell(_ cell: iOSMSample1TMultiModelTableViewCell, atIndex:IndexPath)
    {
        let dataObject: NSDictionary?

        if self.button1.isSelected {
            dataObject = (self.mode1DataArray[atIndex.row] as? NSDictionary)!
        } else {
            dataObject = (self.mode2DataArray[atIndex.row] as? NSDictionary)!
        }

        let date: Date = (dataObject!.value(forKey: "date") as? Date)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd HH:mm:ss"
        cell.titleLabel.text = dateFormatter.string(from: date)

        cell.messageLabel.text = dataObject!.value(forKey: "message") as? String
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: iOSMSample1TMultiModelTableViewCell.cellIdentifier(), for: indexPath) as! iOSMSample1TMultiModelTableViewCell

        // Configure the cell...
        self.configureCell(cell, atIndex: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let maxWidth = self.tableView.frame.width
        self.stubCell?.messageLabel.preferredMaxLayoutWidth = maxWidth - 10

        self.configureCell(self.stubCell!, atIndex: indexPath)
        self.stubCell?.layoutSubviews()
        
        
        let cellSize = self.stubCell!.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        print("cellSize: \(cellSize)")
        
        return cellSize.height + 1
    }
    
    
    //--------------------------------------------
    // MARK: 
    
    func totalContentSize(maxWidthValue: CGFloat) -> CGFloat {
        var rowCount = 0
        
        if self.button1.isSelected {
            rowCount = self.mode1DataArray.count
        } else {
            rowCount = self.mode2DataArray.count
        }
        
        var totalHeight: CGFloat = 0
        for i in 0 ..< rowCount {

            let maxWidth = maxWidthValue // CGRectGetWidth(self.tableView.frame)
            self.stubCell?.messageLabel.preferredMaxLayoutWidth = maxWidth - 10
            
            let indexPath = IndexPath(row: i, section: 1)
            self.configureCell(self.stubCell!, atIndex: indexPath)
            self.stubCell?.layoutSubviews()
            
            let cellSize = self.stubCell!.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)

            totalHeight += cellSize.height
        }

        return totalHeight + self.tableHeaderView.frame.height
    }


 
}
