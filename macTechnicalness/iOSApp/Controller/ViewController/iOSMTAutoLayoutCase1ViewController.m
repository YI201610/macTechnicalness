//
//  iOSMTAutoLayoutCase1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/02/17.
//
//

#import "iOSMTAutoLayoutCase1ViewController.h"
#import "iOSMTAutoLayoutCase1ElementView.h"

@interface iOSMTAutoLayoutCase1ViewController ()

@end

@implementation iOSMTAutoLayoutCase1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*
     @comment
     */
    iOSMTAutoLayoutCase1ElementView* viewObj = [iOSMTAutoLayoutCase1ElementView viewObj];
    
    /*
     @comment
     */
    CGFloat elementWidth = viewObj.frame.size.width;
    CGFloat elementCount = 50;
    _someScrollView.contentSize = CGSizeMake(5 + elementWidth*elementCount + 5,
                                             _someScrollView.frame.size.height);
    
    CGFloat offsetX = 0;
    for(int i = 0; i < elementCount; i++){
        
        iOSMTAutoLayoutCase1ElementView* hogeView = [iOSMTAutoLayoutCase1ElementView viewObj];

        NSString* someString = [NSString stringWithFormat:@"%d_", i];
        
        for(int j = 0; j < i; j++) {
            someString = [someString stringByAppendingString:@"A"];
        }
        
        NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:17] };
        CGSize stringSize = [someString sizeWithAttributes:attributes];
//        NSLog(@"stringSize: %@", NSStringFromCGSize(stringSize));
        
        hogeView.someLabel.frame = CGRectMake(0, 0, stringSize.width, stringSize.height);
        hogeView.someLabel.text = someString;

        hogeView.frame = CGRectMake(offsetX, i, stringSize.width, stringSize.height);
        NSLog(@"hogeView.frame: %@", NSStringFromCGRect(hogeView.frame));

        offsetX += (stringSize.width + 60);
        
        /*
         @comment
         */
        [_someScrollView addSubview:hogeView];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
