//
//  MTTopViewTableDataSource.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/04.
//
//

#import <iOSMTModelKit/MTMTopMenuEntity.h>
#import "MTTopViewTableDataSource.h"


@implementation MTTopViewTableDataSource

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
    
    static NSString* cellID = @"techphone";
    UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = itemObj.titleString;

    return cell;
}


@end
