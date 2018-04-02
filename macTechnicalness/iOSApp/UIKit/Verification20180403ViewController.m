//
//  Verification20180403ViewController.m
//  iOSApp
//

#import "Verification20180403ViewController.h"

@interface Verification20180403ViewController () {
    
    UIView* __tmpView;
}

@end

@implementation Verification20180403ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __tmpView = [self popupView];
    [self.view addSubview: __tmpView];
}

- (IBAction)didSelectButton:(UIButton *)sender {
    //tmpViewのアニメーション
    [UIView animateWithDuration:0.25 animations:^(void){
        CGRect frame = __tmpView.frame;
        frame.origin.y -= 100;
        __tmpView.frame = frame;
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.25 delay:2
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void){
            CGRect frame = __tmpView.frame;
            frame.origin.y += 100;
            __tmpView.frame = frame;
        } completion:^(BOOL finished){
            
        }];
    }];

}


#pragma mark - Private

- (UIView*) popupView {
 
    UIView* tmpView = [[[NSBundle mainBundle] loadNibNamed:@"Popup20180403View" owner:nil options:0] firstObject];
    tmpView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 100);
    return tmpView;
}

@end
