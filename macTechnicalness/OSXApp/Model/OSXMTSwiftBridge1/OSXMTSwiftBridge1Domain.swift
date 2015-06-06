//
//  OSXMTSwiftBridge1Domain.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/05.
//
//

import Cocoa

class OSXMTSwiftBridge1Domain: NSObject {

    var x: Float = 0
    var y: Float = 0
    var width: Float = 0
    var height: Float = 0
    
    /*!
    @abstract
    */
    func hogeOutput() -> Float {
        println("this is swift mix and match test...")
        return x + width + y + height
    }

}
