//
//  ViewController.m
//  patternLearningStrategy
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "ViewController.h"
#import "Context.h"
#import "ConcreteStrategy1.h"
#import "ConcreteStrategy2.h"
#import "ConcteteStrategy3.h"

@interface ViewController () {
 
    Context* _contextObj;

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _contextObj = [[Context alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onButtonAction1:(id)sender {
    _methodname_;

    //コンテキストに、コンクリートストラテジー１を設定する
    _contextObj.strategy = [[ConcreteStrategy1 alloc] init];
    
#warning お決まりのコンテキスト・メソッドを実行する
    [_contextObj sendLog];
}


- (IBAction)onButtonAction2:(id)sender {
    _methodname_;

    //コンテキストに、コンクリートストラテジー２を設定する
    _contextObj.strategy = [[ConcreteStrategy2 alloc] init];
    
#warning お決まりのコンテキスト・メソッドを実行する
    [_contextObj sendLog];

}

- (IBAction)onButtonAction3:(id)sender {

    //コンテキストに、コンクリートストラテジー3を設定する
    _contextObj.strategy = [[ConcteteStrategy3 alloc] init];
    
#warning お決まりのコンテキスト・メソッドを実行する
    [_contextObj sendLog];

}


@end
