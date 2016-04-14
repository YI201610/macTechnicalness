//
//  ViewController.m
//  patternLearningDecorator
//
//  Created by Yuji Imamura on 2014/05/04.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CustomizedTransformation.h"   
#import "UIImage+CustomizedShadow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //---------------------------------
    //オリジナルのUIImageオブジェクトを作成
    //---------------------------------
    UIImage* tmpImage = [UIImage imageNamed:@"star20140506.png"];
    
    //---------------------------------
    //アフィン変換行列構造体を作成
    //---------------------------------
    CGAffineTransform affineRotate = CGAffineTransformMakeRotation(-M_PI/30.0f);
    CGAffineTransform affineTranslate = CGAffineTransformMakeTranslation(80, 100);
    CGAffineTransform affineFinal = CGAffineTransformConcat(affineRotate, affineTranslate);
    
    //-----------------------------------------------
    //デコレーション1. アフィン変換が適用されたUIImageオブジェクトを作成する
    //-----------------------------------------------
    tmpImage = [tmpImage imageWithTransform:affineFinal];
    
    //-----------------------------------------------
    //デコレーション2. 影の効果が適用されたUIImageオブジェクトを作成する
    //-----------------------------------------------
    tmpImage = [tmpImage imageWithShadow];
    
    //----------------------------------------------------
    //上記２つのデコレーションが適用されたUIImageを画面に貼付ける
    //----------------------------------------------------
    UIImageView *imageView = [[UIImageView alloc] initWithImage:tmpImage];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
