// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func assert(x : Bool) {
    #if !NDEBUG
        
        /*noop*/
    #endif
}


println(str)
