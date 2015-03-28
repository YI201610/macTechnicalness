//
//  CommonHeader.h
//  osxAppLearning13
//
//  Created by Yuji Imamura on 2014/07/16.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//


#define debugout(s, ...) NSLog(s, ##__VA_ARGS__)
#define dp(format, ...) printf(format, ##__VA_ARGS__); printf("\n");
#define _methodname_ NSLog(@"%s(line:%d)", __func__, __LINE__);
#define _c_methodname_ printf("%s(line:%d)", __func__, __LINE__); printf("\n");

#define RANDOM_SEED() srandom(time(NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % ((__MAX__+1) - (__MIN__)))
