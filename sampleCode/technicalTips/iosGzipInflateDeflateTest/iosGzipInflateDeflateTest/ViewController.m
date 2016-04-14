//
//  ViewController.m
//  iosGzipInflateDeflateTest
//
//  Created by Yuji Imamura on 2014/02/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "ViewController.h"
#import "NSData+gzipInflateAndDeflate.h"

@implementation ViewController

#pragma mark - onButton

- (IBAction)onButtonExecute:(id)sender {
    _methodname_;
    
    NSString* datPath = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"sample.txt.gz"];
    NSFileHandle* fh = [NSFileHandle fileHandleForReadingAtPath: datPath];
    NSData* dat = [fh readDataToEndOfFile];
    
    NSData* decomp = [dat gzipInflate];
    
    NSString* ret = [[NSString alloc] initWithData:decomp encoding:NSUTF8StringEncoding];
    debugout(@"ret: %@", ret);
}

@end
