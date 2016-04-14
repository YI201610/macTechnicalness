//
//  NSData+gzipInflateAndDeflate.h
//  iosGzipInflateDeflateTest
//
//  Created by Yuji Imamura on 2014/02/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Foundation/Foundation.h>



/*!
 @abstract  Gzip操作を検証

 参考文献:
 Gzip compression/decompression
 http://deusty.blogspot.jp/2007/07/gzip-compressiondecompression.html
 
 */
@interface NSData (gzipInflateAndDeflate)

/*!
 @abstract  gzip形式のデータを解凍する
 */
- (NSData *)gzipInflate;

/*!
 @abstract  データをgzip形式に圧縮する
 */
//- (NSData *)gzipDeflate;

@end
