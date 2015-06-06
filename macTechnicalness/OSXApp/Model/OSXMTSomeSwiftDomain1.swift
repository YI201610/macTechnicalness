//
//  OSXMTSomeSwiftDomain1.swift
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/06.
//
//

import Cocoa

class OSXMTSomeSwiftDomain1: NSObject {

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
