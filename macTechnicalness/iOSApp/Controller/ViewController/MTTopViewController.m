//
//  TopViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "MTTopViewController.h"
#import "MTTopViewTableDataSource.h"
#import <iOSMTModelKit/MTMTopMenuDataController.h>

@interface MTTopViewController () {

    MTMTopMenuDataController* _dataController;
    
    
    MTTopViewTableDataSource* _dataSource;
}

@end

@implementation MTTopViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSBundle* testBundle = [NSBundle bundleForClass:[self class]];
        NSString* plistPath = [testBundle pathForResource:@"topMenu" ofType:@"plist"];
        _dataController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];
        
        _dataSource = [MTTopViewTableDataSource new];
        _dataSource.dataController = _dataController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*!
 @abstract
 */
- (void) loadView
{
    /*!
     @comment
     */
    self.navigationItem.title = NSLocalizedString(@"項目一覧", nil);
    
    /*!
     @comment
     */
    CGRect app_frame = [[UIScreen mainScreen] applicationFrame];
    UIView* baseview = [[UIView alloc] initWithFrame:app_frame];
    [baseview setBackgroundColor:[UIColor blueColor]];
    self.view = baseview;
    self.view.multipleTouchEnabled = NO;
    self.view.exclusiveTouch = YES;
    
    /*!
     @comment
     */
    //
    //CGRect rect_navi = [[[self navigationController] navigationBar] bounds];
    float height_ = app_frame.size.height;// - rect_navi.size.height;
    
    //
    UITableView* tableview_ = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, app_frame.size.width, height_)
                                                           style:UITableViewStylePlain];
    tableview_.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableview_.sectionIndexMinimumDisplayRowCount = 20;
    tableview_.rowHeight = 50;
    tableview_.allowsSelectionDuringEditing = YES;
    tableview_.showsVerticalScrollIndicator = FALSE;
    tableview_.allowsSelection = YES;
    tableview_.multipleTouchEnabled = NO;
    tableview_.exclusiveTouch = YES;
    tableview_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    tableview_.dataSource = _dataSource;
    tableview_.delegate = self;
    
    [self.view addSubview: tableview_];

    
}


@end
