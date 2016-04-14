//
//  NSData+gzipInflateAndDeflate.m
//  iosGzipInflateDeflateTest
//
//  Created by Yuji Imamura on 2014/02/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "NSData+gzipInflateAndDeflate.h"

#include "zlib.h"

@implementation NSData (gzipInflateAndDeflate)

- (NSData *)gzipInflate
{
    //初期判定
    if ([self length] == 0) return self;
    
    // 処理に必要な変数の宣言
    unsigned full_length = [self length];
    unsigned half_length = [self length] / 3;   //作業バッファ長
    
    //
    NSMutableData* decompressed = [NSMutableData dataWithLength: full_length + half_length];
    BOOL done = NO;
    
    //z_stream: 基本となる構造体
    z_stream strm;
    strm.next_in = (Bytef *)[self bytes];   //next input byte をセット
    strm.avail_in = [self length];          //number of bytes available at next_in
    strm.total_out = 0;                     //アウトプット済みのバイト数を０にセットかな
    
    strm.zalloc = Z_NULL;       //メモリ確保を行う独自関数ポインタに初期値を指定
    strm.zfree = Z_NULL;        //メモリ解放を行う独自関数ポインタを初期値を指定
    strm.opaque = Z_NULL;       //メモリ確保/解放時に渡すオプションデータへのポインタに初期値を指定
    

    //------------------
    //初期処理
    //------------------
    /*
     inflateInit2: マクロとして実装されている
     
     (!) このマクロを実行する前に、z_streamを適切に初期化しておくこと。

     第2引数は、windowBits（ウィンドウサイズとも呼ぶらしい）。
     ・履歴バッファ、というものらしい。

     この固定値（15+32, windowBitsに相当）の意味は何か？と思い、Xcodeに組み込まれているzlib.hを参照してみると、
     以下の記述がありました。
     
     The windowBits parameter is the base two logarithm of the maximum window size (the size of the history buffer).  It should be in the range 8..15 for this version of the library. The default value is 15 if inflateInit is used instead.
     
     つまり、15はデフォルト値なのだと判ります。
     
     また、別の箇所に次の様な記述がありました。
     
     windowBits can also be greater than 15 for optional gzip decoding.  Add 32 to windowBits to enable zlib and gzip decoding with automatic header detection, or add 16 to decode only the gzip format (the zlib format will return a Z_DATA_ERROR).
     
     つまり、32はzlib形式のzipでも、gzip形式のzipでも自動で判断して展開(inflate)するためのフラグの意図だと考えられます。
     */
    if (inflateInit2(&strm, (15+32)) != Z_OK) {
        //Error
        return nil;
    }
    
    //------------------
    // 解凍処理
    //------------------
    while (!done)
    {
        debugout(@"total out: %ld", strm.total_out);
        
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length] || strm.avail_out == 0) {
            debugout(@"++++++++++++++++ available buffer +++++++++++++++++++++++++");
            [decompressed increaseLengthBy: half_length];   //展開データ用バッファのサイズを拡張する
        }
        
        //next_out, avail_outの更新はinflate業務において必須
        //次に書き込むバッファの位置をセット
        strm.next_out = strm.total_out + [decompressed mutableBytes];   //展開用バッファへのポインタをセット
        
        //次の出力における残りのフリースペースサイズを更新. avail: availableの省略.
        strm.avail_out = [decompressed length] - strm.total_out;
        
        debugout(@"avail out: %d", strm.avail_out);
        
        // Inflate another chunk.
        /*
         Flushing may degrade compression for some compression algorithms and so it should be used only when necessary.
         
         deflateの場合、安易なFlashの指定は、他の圧縮アルゴリズムよりも、性能を低下させてしまうとのこと。
         必要がなければ、Z_NO_FLUSHの方が、必要処理が経る分だけ、高速化される。
         */
//        int status = inflate (&strm, Z_SYNC_FLUSH);
        int status = inflate (&strm, Z_NO_FLUSH);
        
        /*
         zlib.hより抜粋
         ------------------
         inflate() should normally be called until it returns Z_STREAM_END or an error.
         However if all decompression is to be performed in a single step (a single call of inflate), the parameter flush should be set to Z_FINISH.
         
         In this case all pending input is processed and all pending output is flushed;
         avail_out must be large enough to hold all the uncompressed data.
         (The size of the uncompressed data may have been saved by the compressor for this purpose.)
         */
        if (status == Z_STREAM_END) {
            done = YES;
            
        }else if (status != Z_OK) {
            break;
        }
    }
    
    
    //------------------
    //解凍の終了処理
    //------------------
    /*
     zlib.hより抜粋
     ------------------
     The next operation on this stream must be inflateEnd to deallocate the decompression state.
     The use of Z_FINISH is never required, but can be used to inform inflate that a faster approach may be used for the single inflate() call.
     */
    if (inflateEnd (&strm) != Z_OK) {
        return nil;
    }
    
    
    //------------------
    //データ返却処理
    //------------------
    // Set real length.
    //展開が成功していたら、展開バッファをNSDataに変換して返却
    if (done) {
        //
        [decompressed setLength: strm.total_out];
        
        //展開用バッファを（NSMutableData）を、NSDataに変換して返却
        return [NSData dataWithData: decompressed];
    } else {
        return nil; //失敗
    }
    
}


@end
