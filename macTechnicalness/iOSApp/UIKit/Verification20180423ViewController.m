//
//  Verification20180423ViewController.m
//  iOSApp
//

#import "Verification20180423ViewController.h"

@interface Verification20180423ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeightConstraint;

@end

@implementation Verification20180423ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didSelectButton:(UIButton *)sender {
    
    CGFloat exended = 300;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^(void){

        weakSelf.containerViewHeightConstraint.constant += exended;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.25 delay:1
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void){
                             
                             weakSelf.containerViewHeightConstraint.constant -= exended;
                             [self.view layoutIfNeeded];
                             
                         } completion:^(BOOL finished){
                             
                         }];
    }];

}


@end
