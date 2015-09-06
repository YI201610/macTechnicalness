//
//  MTMSomeDomainEntity.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/06.
//
//

import Foundation

@objc public class MTMSomeDomainEntity: NSObject {

    public var x: Float = 0
    public var y: Float = 0
    public var width: Float = 0
    public var height: Float = 0
    
    /*!
    @abstract
    */
    public func hogeOutput() -> Float {
        print("this is swift mix and match test...")
        return x + width + y + height
    }
    
    
    /*!
    @abstract
    */
    public func sampleTextString() -> String {
        return "このメッセージはSwiftクラスで実装されました。"
    }

}
