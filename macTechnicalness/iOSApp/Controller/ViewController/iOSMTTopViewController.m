//
//  TopViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import <iOSEmbeddedModelKit/MTMTopMenuDataController.h>

#import "iOSMTTopViewController.h"
#import "iOSMTTopViewTableDataSource.h"
#import "CommonHeader.h"


@interface iOSMTTopViewController () {

    MTMTopMenuDataController* _dataController;
    iOSMTTopViewTableDataSource* _dataSource;
}

@end

@implementation iOSMTTopViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        /*
         @comment   Data Controllerを作成します。
         */
        NSBundle* appBundle = [NSBundle bundleForClass:[self class]];
        NSString* plistPath = [appBundle pathForResource:@"topMenu" ofType:@"plist"];
        _dataController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];
        
        /*
         @comment   TableViewのデータソースオブジェクトを作成します。
         */
        _dataSource = [iOSMTTopViewTableDataSource new];
        
        /*
         @comment   データソースオブジェクトに、データコントローラーを設定します。
         */
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
    self.navigationItem.title = NSLocalizedString(@"検証項目一覧", nil);
    
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

#pragma mark - Table View Delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     @comment   選択解除のエフェクトを実行します。
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
     @comment   (!)開発中。選択することができない行は、処理をスキップする。
     */
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.textLabel.textColor == [UIColor lightGrayColor]){
        return;
    }
    
    /*
     @comment   選択された検証項目に対応するView Controller名称を求めます。
     */
    NSString* sectionName = [_dataController sectionNameStringWithIndex:indexPath.section];
    MTMTopMenuEntity* obj = [_dataController itemForSection:sectionName index:indexPath.row];
    NSString* vcName = obj.viewControllerNameString;
    
    if([vcName length] == 0){
        debugout(@"Error: Target Class wan't set. ");
        return;
    }
    
    /*
     @comment   選択された検証項目に対応する画面に遷移します。
     */
    
    //
    UIViewController* addvc = nil;
    UIStoryboard* storyboard = nil;
    
    @try {
        storyboard = [UIStoryboard storyboardWithName:vcName bundle: nil];
    }
    @catch (NSException *exception) {
        debugout(@"Storyboard: %@ は読み込めませんでした", vcName);
    }
    
    if(storyboard){
        addvc = [storyboard instantiateInitialViewController];

        //
        addvc.title = obj.titleString;
        [self.navigationController pushViewController:addvc animated:YES];
    }else{
        
        addvc = [[NSClassFromString(vcName) alloc] init];
        if(!addvc){
            debugout( @"Error: %@ was not found.", vcName );
        }else{
            addvc.title = obj.titleString;
            [self.navigationController pushViewController:addvc animated:YES];
        }
        
    }

}

@end
