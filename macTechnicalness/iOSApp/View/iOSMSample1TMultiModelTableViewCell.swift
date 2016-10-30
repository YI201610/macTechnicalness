//
//  iOSMSample1TMultiModelTableViewCell.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/20.
//
//

import UIKit

@objc(iOSMSample1TMultiModelTableViewCell)
class iOSMSample1TMultiModelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
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
        return "multiModeCell"
    }

}
