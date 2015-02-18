//
//  iOSMTAutoLayoutVisualFormat1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/02/17.
//

#import "iOSMTAutoLayoutVisualFormat2ViewController.h"

@interface iOSMTAutoLayoutVisualFormat2ViewController ()

@end

@implementation iOSMTAutoLayoutVisualFormat2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton* button1 = _someButton1;
    UIButton* button2 = _someButton2;
    NSDictionary* viewsDictionary = NSDictionaryOfVariableBindings(button1, button2);
    NSLog(@"viewsDic: %@", viewsDictionary);

    NSArray* constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"[button1][button2]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:viewsDictionary];
    [self.view addConstraints:constraintArray];
}


@end
