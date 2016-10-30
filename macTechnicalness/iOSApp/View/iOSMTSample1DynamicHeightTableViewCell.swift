//
//  iOSMTSample1DynamicHeightTableViewCell.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/19.
//
//

import UIKit

@objc(iOSMTSample1DynamicHeightTableViewCell)
class iOSMTSample1DynamicHeightTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //--------------------------------------------
    // MARK:
    
    class func cellIdentifier() -> String {
        return "dynamicHeightCell"
    }

}
