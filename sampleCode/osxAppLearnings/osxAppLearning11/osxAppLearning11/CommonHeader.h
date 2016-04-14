//
//  CommonHeader.h
//  osxAppLearning11
//
//  Created by Yuji Imamura on 2014/06/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#define debugout(s, ...) NSLog(s, ##__VA_ARGS__)
#define dp(format, ...) printf(format, ##__VA_ARGS__); printf("\n");
#define _methodname_ NSLog(@"%s(line:%d)", __func__, __LINE__);
#define _c_methodname_ printf("%s(line:%d)", __func__, __LINE__); printf("\n");


//#if ! defined(DEBUG) && ! defined(__NDEBUG__)
//#warning Neither of __DEBUG__/__NDEBUG__ macros are #defined
//#endif
//
//#ifdef DEBUG
//
//#define debugout(s, ...) NSLog(s, ##__VA_ARGS__)
//#define dp(format, ...) printf(format, ##__VA_ARGS__); printf("\n");
//#define _methodname_ NSLog(@"%s(line:%d)", __func__, __LINE__)
//#define _c_methodname_ printf("%s(line:%d)", __func__, __LINE__); printf("\n");
//
//#define _checkRetainCount(str, obj) debugout(@"CHECK_RETAIN_CNT{%s}[%@]: retain count: %d", __func__, str, [obj retainCount]);
//
//#else
//
//#define debugout(s, ...)
//#define dp(format, ...)
//#define _methodname_
//#define _c_methodname_
//
//#define _checkRetainCount(str, obj)

