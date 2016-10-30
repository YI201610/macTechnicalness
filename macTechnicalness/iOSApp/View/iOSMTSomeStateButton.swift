//
//  iOSMTSomeStateButton.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/07/20.
//
//

import UIKit

class iOSMTSomeStateButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.isExclusiveTouch = true
    }
    
    func changeState(_ nextState: UIControlState) {
        
        /*
        @comment
        
        static var Normal: UIControlState { get }
        static var Highlighted: UIControlState { get } // used when UIControl isHighlighted is set
        static var Disabled: UIControlState { get }
        static var Selected: UIControlState { get } // flag usable by app (see below)
        static var Application: UIControlState { get } // additional flags available for application use
        static var Reserved: UIControlState { get } // flags reserved for internal framework use

        */
        switch nextState {
        case UIControlState.selected:
            self.isSelected = true
            self.backgroundColor = UIColor(red: 254/255.0, green:194/255.0, blue: 11/255.0, alpha:1)
            break
            
        default:
            self.isSelected = false
            self.backgroundColor = UIColor.lightGray
            break
        }
        
    }

}
