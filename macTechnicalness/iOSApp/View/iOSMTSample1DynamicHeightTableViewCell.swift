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

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        var preferedMaxWidth: CGFloat = 0

        /*
        @comment    デバイスの幅に応じて、preferredMaxValue値を設定。※mainLabel配置のレイアウト設計にも依存
        */
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
        {
            //iPad
            preferedMaxWidth = 760.0
        }
        else
        {
            //iPhone
            preferedMaxWidth = 310.0
        }
        
        self.mainLabel.preferredMaxLayoutWidth = preferedMaxWidth
    }
}
