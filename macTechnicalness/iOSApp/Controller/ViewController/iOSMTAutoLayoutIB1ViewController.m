//
//  iOSMTAutoLayoutIB1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/02/21.
//
//


#import "iOSMTAutoLayoutIB1ViewController.h"

typedef enum : NSUInteger {
    defaultState,
    view2State,
} viewState;

@interface iOSMTAutoLayoutIB1ViewController () {

    viewState _controllerState;
    
}

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view2HeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view2TopVerticalSpaceConstraint;


@end

@implementation iOSMTAutoLayoutIB1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view removeConstraint:_view2TopVerticalSpaceConstraint];
    
    _controllerState = defaultState;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonAction:(id)sender {
    
    if(_controllerState == defaultState){
        
        [self.view addConstraint:_view2TopVerticalSpaceConstraint];

        [UIView animateWithDuration:0.5
                         animations:^{
                             [self.view layoutIfNeeded];
                         }];

        _controllerState = view2State;
    }else{
        
        [self.view removeConstraint:_view2TopVerticalSpaceConstraint];

        [UIView animateWithDuration:0.5
                         animations:^{
                             [self.view layoutIfNeeded];
                             [self.view setNeedsDisplay];
                         }];

        _controllerState = defaultState;
    }
    

}

@end
