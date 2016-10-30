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
    ・子は、プロトコルにより、親と連携する。

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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    /**
        各コンテナビューコントローラーの高さを計算する
    */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var heightValue:CGFloat = 50
        
        /*
        @comment
        */
        if indexPath.row == 1 {
            heightValue = self.sub2ViewController!.totalContentSize(maxWidthValue: tableView.frame.width)
        }

        return heightValue
    }
    
    
    // MARK: - Segue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sub1ViewController" {
            self.sub1ViewController = segue.destination as? iOSMTContainerSample2Sub1ViewController
        } else if segue.identifier == "sub2ViewController" {
            self.sub2ViewController = segue.destination as? iOSMTMultiTableViewController
        }
        
        
    }
    


}
