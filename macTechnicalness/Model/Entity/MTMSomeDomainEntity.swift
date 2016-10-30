//
//  MTMSomeDomainEntity.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/06.
//
//

import Foundation

@objc open class MTMSomeDomainEntity: NSObject {

    open var x: Float = 0
    open var y: Float = 0
    open var width: Float = 0
    open var height: Float = 0
    
    /*!
    @abstract
    */
    open func hogeOutput() -> Float {
        print("this is swift mix and match test...")
        return x + width + y + height
    }
    
    
    /*!
    @abstract
    */
    open func sampleTextString() -> String {
        return "このメッセージはSwiftクラスで実装されました。"
    }

}
