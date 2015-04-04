//
//  iOSMTStoryboardCase1Scene2ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/01.
//
//

#import "iOSMTStoryboardCase1Scene2ViewController.h"

@interface iOSMTStoryboardCase1Scene2ViewController ()

@end

@implementation iOSMTStoryboardCase1Scene2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

//セクション数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//各セクションの項目数を返す
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //	debugout(@"cell for row at IndexPath: (%d, %d)", indexPath.section, indexPath.row);

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"scene2Cell"];

    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"gotoScene3" sender: cell];
    
}



@end
