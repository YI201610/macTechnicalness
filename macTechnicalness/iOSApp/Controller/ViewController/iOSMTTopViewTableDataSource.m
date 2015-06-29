//
//  MTTopViewTableDataSource.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/04.
//
//

#import "iOSMTTopViewTableDataSource.h"
#import "CommonHeader.h"

@implementation iOSMTTopViewTableDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = [_dataController numberOfSection];
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionName = [_dataController sectionNameStringWithIndex:section];
    NSInteger count = [_dataController numberOfItemForSection:sectionName];
    return count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* sectionTitleString = [_dataController sectionNameStringWithIndex:section];
    return sectionTitleString;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger sectionNo = indexPath.section;
    NSInteger rowNo = indexPath.row;

    NSString *sectionName = [_dataController sectionNameStringWithIndex:sectionNo];
    MTMTopMenuEntity* itemObj = [_dataController itemForSection:sectionName index:rowNo];
    
    static NSString* cellID = @"macTechnicalness";
    UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.text = itemObj.titleString;
    
    if ([itemObj.viewControllerNameString length] == 0) {
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    
    UIStoryboard* storyboard = nil;
    @try {
        storyboard = [UIStoryboard storyboardWithName:itemObj.viewControllerNameString bundle: nil];
    }
    @catch (NSException *exception) {
    }

    UIViewController* vc0 = [storyboard instantiateInitialViewController];
    UIViewController* vc = [[NSClassFromString(itemObj.viewControllerNameString) alloc] init];
    if(vc0 == nil && vc == nil){
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}


@end
